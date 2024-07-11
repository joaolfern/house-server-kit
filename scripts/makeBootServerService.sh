#!/bin/bash

# Source .bashrc to initialize environment variables
source "$HOME/.bashrc"

# Function to source nvm settings
source_nvm() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# Ask for user inputs
read -p "Enter the service name: " service_name
read -p "Enter the path: " path
read -p "Enter package manager (yarn/npm, default is yarn): " package_manager

# Set default package manager to yarn if not specified
package_manager=${package_manager:-yarn}

# Execute custom command if provided
read -p "Enter custom command (optional): " custom_command
if [ -n "$custom_command" ]; then
    source_nvm  # Source nvm settings
    eval "$custom_command"
fi

# Ensure nvm environment is sourced for package_manager_path determination
source_nvm

# Determine the package manager path after potentially setting up environment
if [ "$package_manager" = "npm" ]; then
    package_manager_path=$(which npm)
else
    package_manager_path=$(which yarn)
fi

# Create the service file content
service_file_content="[Unit]
Description=$service_name
After=network.target

[Service]
ExecStart=/bin/bash -c 'cd $path && $package_manager_path run dev --host'
Restart=always
User=$(whoami)
Environment=PATH=/usr/bin:/usr/local/bin:$(dirname "$package_manager_path")
Environment=NODE_ENV=production
WorkingDirectory=$path

[Install]
WantedBy=multi-user.target"

# Write the service file
echo "$service_file_content" | sudo tee /etc/systemd/system/$service_name.service > /dev/null

# Reload systemd to apply the new service file
sudo systemctl daemon-reload

# Enable the service to start on boot
sudo systemctl enable $service_name.service

# Start the service
sudo systemctl start $service_name.service

# Show the status of the service
sudo systemctl status $service_name.service
