#!/bin/bash
export FLASK_ENV=development
echo $FLASK_ENV
export FLASK_APP=app.py
echo $FLASK_APP
flask run
