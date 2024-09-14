#Base image 
FROM node:alpine
#Create Working Directory
WORKDIR /app
#Copy package.json into the working directory
COPY  package*.json ./
#Install application dependencies
RUN npm install
#copy the rest of application into working directory
COPY . /app
#Expose the port for application
EXPOSE 8000
#Command to run application
CMD [ "node", "index.js"]
