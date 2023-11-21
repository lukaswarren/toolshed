from flask import Flask
from app.database.database import init_db
from app.database.database import db_session

from config import Config


def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)
    init_db()
    from .auth import auth
    # Initialize Flask extensions here

    # Register blueprints here
    app.register_blueprint(auth.bp)

    @app.route('/test/')
    def test_page():
        return '<h1>Testing the Flask Application Factory Pattern</h1>'

    @app.teardown_appcontext
    def shutdown_session(exception=None):
        db_session.remove()

    return app



