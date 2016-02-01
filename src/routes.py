from bottle import get, post, route, static_file, error

__author__ = "Aishwarya Sharma"


# Web App Entry point. Returns index.html
@route('/')
def index():
    return static_file("index.html", root="static")


# Route to serve static files. Uses regex to resolve filename.
@route('/:filename#.*#')
def static(filename):
    return static_file(filename, root="static")


# Route for 404 errors.
@error
def error():
    return static_file("404.html", root="static")


# REST API Routes

@post("/api/login")
def login(username, password):
    pass


# Add or edit the personal details of a teacher or a student.
@post("/api/add_or_edit_person")
def add_or_edit_person(id=None):
    pass


# View a student's or teacher's record
@post("/api/view_person_record")
def view_record(id):
    pass


# Delete a person from the system
@post("/api/delete_person")
def delete_person(id):
    pass


