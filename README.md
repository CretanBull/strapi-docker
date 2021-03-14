# Strapi-docker
A docker image for running your existing strapi projects paired with a PostgreSQL db in a container. This elminates the over-head of installing all the various softwares required for the project on your local machine and thus contaminating the system. 

#### Prerequisites
- Docker CE - https://docs.docker.com/get-docker/
- Docker Compose Cli - https://docs.docker.com/compose/install/

#### Installation steps
- Download a zip of the repository
- Extract the zip file
- Copy the contents of the extracted folder to your project's root directory
- Cross check the variables used in the `docker-compose.yml` file with your project's `.env` file
- You're ready to go!

#### Running your project
- Run the following command to start the project\
`docker-compose up -d`\
This command will start the docker in detached mode (i.e you will not be able to see the debug messages)

- Alternatively, you could also start the docker in attached termainal mode to see the errors in real time with the following command:\
`docker-compose up`

#### Viewing the site in browser
- Once the docker containers are up and running, you could just visit the site by hitting the following url in your broswer\
`localhost:1337`

#### Stoppping the containers
- You can always stop the containers once you're done with the project with the following command:\
`docker-compose down`

#### Rebuilding the container
- If you make any changes to the `Dockerfile`, then you will need to rebuild the image with the following command:\
`docker-compose up --build`
