from app import app, db, Student, Subject

with app.app_context():
    db.create_all()
    print("Database tables created successfully!")




    students = [
        Student(name="John Doe", program="Software Engineering"),
        Student(name="Jane Smith", program="Software Engineering"),
        Student(name="Alice Johnson", program="Software Engineering"),
        Student(name="Bob Brown", program="Software Engineering"),
        Student(name="Charlie Davis", program="Software Engineering"),
        Student(name="David Evans", program="Software Engineering"),
        Student(name="Eva Green", program="Software Engineering"),
        Student(name="Frank Harris", program="Software Engineering"),
        Student(name="Grace Lee", program="Software Engineering"),
        Student(name="Hank Miller", program="Software Engineering"),
    ]

    # Add Subjects
    subjects = [
        Subject(name="Intro to Programming", year=1),
        Subject(name="Data Structures", year=1),
        Subject(name="Algorithms", year=2),
        Subject(name="Operating Systems", year=2),
        Subject(name="Software Engineering", year=3),
        Subject(name="Database Systems", year=3),
        Subject(name="Computer Networks", year=4),
        Subject(name="Web Development", year=4),
    ]

    # Add all records to the database
    db.session.add_all(students + subjects)
    db.session.commit()

    print("Database tables created and data populated successfully!")