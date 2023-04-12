import os
import environ
from pathlib import Path


BASE_DIR = Path('.')

env = environ.Env()
env_file = BASE_DIR / '.env'

if os.path.exists(env_file):
    environ.Env.read_env(env_file)

SECRET_KEY = env.str('SECRET_KEY', 'this-is-the-default-secret-key')
DEBUG = env.bool('DEBUG', True)

DATABASE_URL = env.db_url('DATABASE_URL', f'sqlite:///db.sqlite3')

STATIC_ROOT = env.str('STATIC_ROOT', 'static')
MEDIA_ROOT = env.str('MEDIA_ROOT', 'media')

REDIS_HOST = env.str('REDIS_HOST', 'redis')
REDIS_PORT = env.str('REDIS_PORT', 6379)

PAGE_SIZE = env.int('PAGE_SIZE', 20)
ALLOWED_HOSTS = env.str('ALLOWED_HOSTS', '*').split(',')
