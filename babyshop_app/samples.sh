#!/bin/sh

echo "Loading sample data..."
# OLD - import DB instead of importing samples
# cp /app/sample_data/sample.sqlite3 /app/db.sqlite3

# Creating import data with
# python3 manage.py dumpdata products --indent 4 > products/fixtures/products_data.json

# import sample data
python3 manage.py loaddata products/fixtures/products_data.json

# import images
cp -r /app/sample_data/images /app/media/
