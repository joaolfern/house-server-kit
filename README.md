# House Server Kit

This repository contains tools and scripts I use for hosting and managing servers accessible to devices on my local network. 

## `makeBootServerService.sh`

This script initializes a server to start automatically when the computer is turned on. It prompts the user for necessary inputs and creates a systemd service for managing the server.

### Usage

1. Clone the repository:
    ```bash
    git clone git@github.com:joaolfern/house-server-kit.git
    cd house-server-kit
    ```

2. Make the script executable:
    ```bash
    chmod +x scripts/makeBootServerService.sh
    ```

3. Run the script:
    ```bash
    ./scripts/makeBootServerService.sh
    ```

4. Follow the prompts to set up your service.

### Example

Here's a step-by-step example of using the `makeBootServerService.sh` script:

1. Enter the service name:
    ```
    Enter the service name: my-local-server
    ```

2. Enter the path to your server directory:
    ```
    Enter the path: /home/user/my-server
    ```

3. Select the package manager:
    ```
    Enter package manager (default: yarn): npm
    ```

4. Enter a custom command (optional):
    ```
    Enter custom command (optional): nvm use 20
    ```

5. The script will create and start the service, and you can check its status with:
    ```bash
    sudo systemctl status my-local-server.service
    ```

## `makeLocalRedirectPage.sh`

The script creates a deploy ready html page that allows users within your local network to access your address through a user-friendly url (such as a netlify link)

### Usage

1. Clone the repository:
    ```bash
    git clone git@github.com:joaolfern/house-server-kit.git
    cd house-server-kit
    ```

2. Make the script executable:
    ```bash
    chmod +x scripts/makeLocalRedirectPage.sh
    ```

3. Run the script:
    ```bash
    ./scripts/makeLocalRedirectPage.sh
    ```
4. Follow the prompts to create you redirect page.

### Example

Here's a step-by-step example of using the `makeLocalRedirectPage.sh` script:

1. Enter the company IP address:
    ```
    Enter the company IP address (default: http://192.168.0.7:5173): http://192.168.0.7:5173
    ```

2. Enter the home IP address:
    ```
    Enter the home IP address (default: http://192.168.0.7:5173): http://192.168.0.7:5173
    ```

3. Enter the company days:
    ```
    Enter the company days as a comma-separated list (default: 1,3,5): 1,3,5
    ```

4. The script will create the folder `local-redirect`, generate an `index.html` file, and initialize a Git repository in the folder.

5. Add a GitHub remote and push your changes:
    ```
    git remote add origin <your-github-repository-url>
    git push -u origin master
    ```

6. Host your page on Netlify by visiting:
    ```
    https://app.netlify.com/start
    ```

7. Follow the instructions to deploy the `local-redirect` folder.
