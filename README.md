# starting the project #

# First build the project and run the command:
    docker-compose build

# Migrate the database to our docker container:
    docker-compose run web python3 manage.py migrate

# Start the Project with:
    docker-compose up
