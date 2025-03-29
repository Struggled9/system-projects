from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy

# Initialize Flask App
app = Flask(__name__)

# Configure SQLAlchemy to use PyMySQL as the MySQL driver
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@localhost/assignment'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

# Initialize SQLAlchemy
db = SQLAlchemy(app)


# Student Model
class Student(db.Model):
    __tablename__ = 'students'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    program = db.Column(db.String(100), nullable=False)

# Subject Model
class Subject(db.Model):
    __tablename__ = 'subjects'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    year = db.Column(db.Integer, nullable=False)

# Endpoint 1: /students
@app.route('/students', methods=['GET'])
def get_students():
    students = Student.query.limit(10).all()  # Get top 10 students
    students_list = [{'name': student.name, 'program': student.program} for student in students]
    return jsonify(students_list)

# Endpoint 2: /subjects
@app.route('/subjects', methods=['GET'])
def get_subjects():
    subjects = Subject.query.order_by(Subject.year).all()
    subjects_by_year = {}
    for subject in subjects:
        if subject.year not in subjects_by_year:
            subjects_by_year[subject.year] = []
        subjects_by_year[subject.year].append(subject.name)

    # Structure the response clearly
    response = [{'year': year, 'subjects': subjects_by_year[year]} for year in subjects_by_year]
    return jsonify(response)

if __name__ == '__main__':
    app.run(debug=True, port=5001)