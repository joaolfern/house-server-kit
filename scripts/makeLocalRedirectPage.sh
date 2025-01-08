#!/bin/bash

# Set the folder name to "local-redirect"
folder_name="local-redirect"

# Create the folder
mkdir -p "$folder_name"

# Change to the new folder and check if cd succeeds
cd "$folder_name" || { echo "Failed to enter the folder. Exiting..."; exit 1; }

# Initialize Git repository
git init

# Prompt user for the company IP address
read -p "Enter the company IP address (default: http://10.10.0.218:5173/): " company_address
company_address=${company_address:-http://10.10.0.218:5173/}

# Prompt user for the home IP address
read -p "Enter the home IP address (default: http://172.24.196.14:5173/): " home_address
home_address=${home_address:-http://172.24.196.14:5173/}

# Explain weekdays numbering
echo "Weekday numbering: Sunday=0 Monday=1, Tuesday=2, ..., Saturday=7."

# Prompt user for company days
read -p "Enter the company days as a comma-separated list (default: 1,3,5): " company_days
company_days=${company_days:-1,3,5}

# Generate the HTML file
cat <<EOL > index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Serveruler</title>
  <link rel="icon" href="/favicon.ico" type="image/x-icon">
  <script>
    function getIsCompanyDay() {
      const COMPANY_DAYS = [${company_days}];
      const weekDay = new Date().getDay();
      const isCompanyDay = COMPANY_DAYS.includes(weekDay);

      return isCompanyDay;
    }

    const COMPANY_IP_ADDRESS = "${company_address}";
    const HOME_IP_ADDRESS = "${home_address}";

    const isCompanyDay = getIsCompanyDay();
    const ipAddress = isCompanyDay ? COMPANY_IP_ADDRESS : HOME_IP_ADDRESS;

    window.location.href = ipAddress;
  </script>
</head>
<body>
</body>
</html>
EOL

# Add the HTML file to Git and commit
git add index.html
git commit -m "Initial commit with index.html"

# Print success message
echo "Folder '$folder_name' created, Git repository initialized, and index.html file generated."
echo
echo "Next steps:"
echo "1. Add a GitHub remote to this repository with the following command:"
echo "   git remote add origin <your-github-repository-url>"
echo "2. Push the code to GitHub:"
echo "   git push -u origin master"
echo
echo "3. To host your page, go to https://app.netlify.com/start and follow the instructions."
