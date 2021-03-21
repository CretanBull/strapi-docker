# Strapi-docker
A docker image for running your existing strapi projects paired with a PostgreSQL db in a container. This eliminates the over-head of installing all the various softwares required for the project on your local machine and thus contaminating the system. 

#### Prerequisites
- Docker CE - https://docs.docker.com/get-docker/
- Docker Compose Cli - https://docs.docker.com/compose/install/

#### Installation steps
- Download a zip of the repository
- Extract the zip file
- Copy the contents of the extracted folder to your project's root directory *(Only copy the files mentioned below)*
  > Dockerfile\
  > docker-compose.yml\
  > .dockerignore
- Cross check the variables used in the `docker-compose.yml` file with your project's `.env` file
- Almost done! Follow the next steps to connect your application to db. 

#### Connecting application to database:
- Firstly, make sure the variables referenced in the `docker-compose.yml` match the db variables used in the project's `.env` file
- Make sure you point the database host to the `container-name` of the db in your project's `.env` file
  > In this example it will be `strapi-db`. If you do change the container name, then make sure to change the same in your project's `.env` file\
  > \
  > ex. of `.env file` in your projec'ts root directory\
  > HOST=0.0.0.0\
  > PORT=1337\
  > DATABASE_HOST=strapi-db\
  > DATABASE_PORT=5432
- Done! The app should now be configured to point to the db container mentioned in the `docker-compose.yml` file. 

#### Importing an existing db dump
- Get the docker id of the postgres container:\
  `docker ps`
  
  Output will be similar to the following:
  | CONTAINER ID |  IMAGE                     | ... |  NAMES     |
  | ------------ | -------------------------- | --- |----------- |
  | 65e813c2ce8b |  your_project_strapi       | ... | strapi-cms |
  | 78e528453ced |  postgres                  | ... | strapi-db  |
  
- Copy the `CONTAINER ID` of the postgres image and then replace it in the following command:\
 `cat ./your-db-dump.sql | docker exec -i <CONTAINER ID> psql -U <DATABASE_USERNAME> -d <DATABASE_PASSWORD>`
- Perfect! Your db is now fully populated and all you need to do is run your application by following the next steps. 

#### Running your project
- Run the following command to start the project\
`docker-compose up -d`\
This command will start the docker in detached mode (i.e you will not be able to see the debug messages)

- Alternatively, you could also start the docker in attached terminal mode to see the errors in real time with the following command:\
`docker-compose up`. \
To close the attached terminal mode just press `Ctrl + C`

#### Viewing the site in browser
- Once the docker containers are up and running, you could just visit the site by hitting the following url in your broswer\
`localhost:1337`

#### Stoppping the containers
- You can always stop the containers once you're done with the project with the following command:\
`docker-compose down`

#### Rebuilding the container
- If you make any changes to the `Dockerfile`, then you will need to rebuild the image with the following command:\
`docker-compose up --build`
