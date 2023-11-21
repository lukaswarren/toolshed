import os

from sqlalchemy.sql import func

basedir = os.path.abspath(os.path.dirname(__file__))


class DBconfig:
    SECRET_KEY = os.environ.get('SECRET_KEY')
    SQLALCHEMY_DATABASE_URI = os.environ.get('DATABASE_URI') \
                              or 'mysql+pymysql://newuser:tool-shed@localhost:3306/test_db'
    SQLALCHEMY_TRACK_MODIFICATIONS = False