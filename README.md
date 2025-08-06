Setup n8n on Ubuntu using Docker
This guide helps you install Docker, Docker Compose, and run n8n (an automation platform like Zapier) on Ubuntu in just a few steps using a shell script.

📁 Step-by-Step Instructions
1. 📥 Download the Script
Save the following Bash script as install_n8n.sh:

bash
Copy
Edit
# Create the install script
nano install_n8n.sh
Paste the contents from the provided install script.

2. 🔓 Give Execute Permission
Before running the script, you need to make it executable:

bash
Copy
Edit
chmod +x install_n8n.sh
This command gives the script permission to run like a program.

3. ▶️ Run the Script
Now run the script:

bash
Copy
Edit
./install_n8n.sh
The script will:

Update system packages

Install Docker

Install Docker Compose

Create a folder and Docker Compose config for n8n

Launch the n8n container

4. 🧑‍🔧 Fix Docker Permission (Optional)
If after running the script you get an error like:

bash
Copy
Edit
Got permission denied while trying to connect to the Docker daemon socket
It means your user doesn’t yet have permission to use Docker.

Either log out and log back in, or run this command to reload your group:

bash
Copy
Edit
newgrp docker
✅ n8n Access Info
Once installed, n8n will be available at:

URL: http://localhost:5678
Username: admin
Password: admin123

🔒 You can change the credentials by editing the docker-compose.yml file inside the ~/n8n-docker folder.
