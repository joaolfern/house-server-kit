# House Server Kit

This repository contains tools and scripts I use for hosting and managing servers accessible to devices on my local network. 

## Scripts

### `makeBootServerService.sh`

This script initializes a server to start automatically when the computer is turned on. It prompts the user for necessary inputs and creates a systemd service for managing the server.

### Usage

1. Clone the repository:
    ```bash
    git clone git@github.com:joaolfern/house-server-kit.git
    cd house-server-kit
    ```

2. Make the script executable:
    ```bash
    chmod +x makeBootServerService.sh
    ```

3. Run the script:
    ```bash
    ./makeBootServerService.sh
    ```

4. Follow the prompts to set up your service.

## Example

Here's a step-by-step example of using the `makeBootServerService.sh` script:

1. Enter the service name:
    ```
    Enter the service name: my-local-server
    ```

2. Enter the path to your server directory:
    ```
    Enter the path: /home/user/my-server
    ```

3. Enter a custom command (optional):
    ```
    Enter custom command (optional): nvm use 20
    ```

4. Select the package manager:
    ```
    Enter package manager (default: yarn): npm
    ```

5. The script will create and start the service, and you can check its status with:
    ```bash
    sudo systemctl status my-local-server.service
    ```

## Apps

### Online Redirector (WIP)

I host this on Netlify, where it conditionally redirects users who access a user-friendly domain to my local network IP.
