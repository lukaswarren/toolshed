from flask import Flask, request, jsonify

app = Flask(__name__)


# Define the data model for a user

class User:
    def __init__(self, id, name, email):
        self.id = id
        self.name = name
        self.email = email


users = []
