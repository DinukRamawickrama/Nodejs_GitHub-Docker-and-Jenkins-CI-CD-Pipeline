# Use the latest version of the Node.js image as the base image
FROM node:14

# Set the working directory inside the container to /usr/src/app
WORKDIR /usr/src/app  

# Copy the contents of the local "nodeapp" directory to the root directory of the container
COPY nodeapp/package*.json ./ 

# Run the npm install command to install the dependencies specified in package.json
RUN npm install  

# Copy the entire application source code from the nodeapp directory
COPY nodeapp .

# Expose port 3000 to allow incoming connections to the container
EXPOSE 3000  

# Start the application by running the "npm start" command
CMD [ "node", "index.js" ]  
