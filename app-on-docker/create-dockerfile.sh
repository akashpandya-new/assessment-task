#!/bin/bash

# Create Dockerfile
echo "FROM node:18-alpine" > Dockerfile
echo "WORKDIR /usr/src/app" >> Dockerfile
echo "COPY package*.json ./" >> Dockerfile
echo "RUN npm install" >> Dockerfile
echo "COPY . ." >> Dockerfile
echo "EXPOSE 3000" >> Dockerfile
echo 'CMD ["npm", "start"]' >> Dockerfile

echo "Dockerfile has been created successfully."
