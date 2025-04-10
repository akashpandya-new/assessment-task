#!/bin/bash

# Create package.json
echo "{" > package.json
echo '  "name": "docker-node-app",' >> package.json
echo '  "version": "1.0.0",' >> package.json
echo '  "main": "app.js",' >> package.json
echo '  "scripts": {' >> package.json
echo '    "start": "node app.js"' >> package.json
echo '  },' >> package.json
echo '  "dependencies": {' >> package.json
echo '    "express": "^4.17.1"' >> package.json
echo '  }' >> package.json
echo "}" >> package.json

echo "package.json has been created successfully."
