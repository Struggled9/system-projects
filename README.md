# Flask API for Students and Subjects

## Project Overview
This project is a Flask-based REST API that interacts with a MySQL database. The API provides two main endpoints:
1. `/students` - Returns a list of students with their names and enrolled programs.
2. `/subjects` - Returns a list of subjects for the Software Engineering program, organized by academic year.

## Features
- Flask-based API with JSON responses
- MySQL database integration
- Organized subject list spanning from Year 1 to Year 4
- Deployed on AWS with public accessibility

## Setup Instructions

### Prerequisites
Ensure you have the following installed:
- Python 3
- Flask
- MySQL Server
- Git
- AWS Ubuntu Server (for deployment)

### Installation
1. **Clone the Repository**
   ```bash
   git clone <your-github-repo-url>
   cd flask-api
   ```
2. **Create a Virtual Environment**
   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```
3. **Install Dependencies**
   ```bash
   pip install -r requirements.txt
   ```
4. **Configure MySQL Database**
   - Create a MySQL database.
   - Update the database credentials in `config.py`.

5. **Run the Flask Application**
   ```bash
   flask run
   ```

## Endpoints
### 1. Get Students
http://51.20.12.42:5001/students
**Method:** `GET`  
**Response:** JSON list of at least 10 students with names and enrolled programs.

### 2. Get Subjects
**[URL](http://51.20.12.42:5001/subjects):** `/subjects`  
**Method:** `GET`  
**Response:** JSON list of Software Engineering subjects, categorized by academic year.

## Deployment
### Steps to Deploy on AWS
1. **Launch an AWS Ubuntu Server (Free Tier)**
2. **Install Required Packages**
   ```bash
   sudo apt update && sudo apt install python3 python3-pip mysql-server nginx -y
   ```
3. **Clone the Repository & Set Up Virtual Environment**
   ```bash
   git clone <your-github-repo-url>
   cd flask-api
   python3 -m venv venv
   source venv/bin/activate
   pip install -r requirements.txt
   ```
4. **Run the Application**
   ```bash
   flask run --host=0.0.0.0
   ```
5. **Configure Nginx for Reverse Proxy (if needed)**
   - Edit `/etc/nginx/sites-available/default`
   - Add a server block to proxy requests to Flask
   - Restart Nginx: `sudo systemctl restart nginx`

##  Task 1: Bash Script Development

All scripts are located in the `bash_scripts/` directory.

### `health_check.sh`

**Purpose**: Monitor server resource usage and API status.

**Features**:
- Checks CPU, memory, and disk space usage.
- Verifies the web server (Apache/Nginx) is running.
- Tests API endpoints `/students` and `/subjects` using `curl`.
- Logs results to `/var/log/server_health.log`.
- Adds warnings if disk space < 10% or endpoints are down.

---

 ### `backup_api.sh`

**Purpose**: Back up the API project and database.

**Features**:
- Archives the API project directory to `/home/ubuntu/backups/`.
- Exports the database to `.sql` file in the same folder.
- Deletes backups older than 7 days.
- Logs backup events to `/var/log/backup.log`.

---
### `update_server.sh`

**Purpose**: Automate server updates and API deployment.

**Features**:
- Runs `apt update && apt upgrade -y`.
- Pulls the latest code from GitHub.
- Restarts the web server (Apache/Nginx).
- Logs events to `/var/log/update.log`.
- If `git pull` fails, logs an error and exits.

---

##  Version Control

- Create a directory in your Assignment 1 GitHub repo:

```bash
mkdir bash_scripts


