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
**URL:** `/students`  
**Method:** `GET`  
**Response:** JSON list of at least 10 students with names and enrolled programs.

### 2. Get Subjects
**URL:** `/subjects`  
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

## Version Control
- Regular commits are made to track development progress.
- All changes are pushed to GitHub for version tracking.

## Submission
- **GitHub Repository:** `<your-github-repo-url>`
- **Deployed API URL:** `<your-deployed-api-url>`

Ensure the API is accessible before submission. Happy coding!

