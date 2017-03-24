activate_this = '/var/www/demo/.venv/bin/activate_this.py'
execfile(activate_this, dict(__file__=activate_this))

import os
os.environ['DATABASE_URI'] = 'mysql://databases-server1.com:demo@databases-server1.com/demo'

import sys
sys.path.insert(0, '/var/www/demo/app')

from demo import app as application
