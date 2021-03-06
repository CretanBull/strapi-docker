FROM strapi/base:12-alpine

# SET WORKING DIRECTORY
WORKDIR /srv/app

# COPY THE PACKAGE.JSON FILES
COPY ./package*.json ./

# INSTALL DEPENDENCIES
RUN yarn install

# SET ENVIRONMENT TO DEVELOPMENT
# ENV NODE_ENV development

# BUILD THE STRAPI ADMIN UI FILES
RUN yarn build

# EXPOSE THE PORT TO EXTERNAL REQUESTS
EXPOSE 1337

# RUN yarn develop COMMAND
CMD ["yarn", "develop"]