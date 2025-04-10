#!/bin/bash

# Create app.js
echo "const express = require('express');" > app.js
echo "const app = express();" >> app.js
echo "const port = 3000;" >> app.js
echo "" >> app.js
echo "app.get('/', (req, res) => {" >> app.js
echo "    res.send('This represents the node js application inside Docker');" >> app.js
echo "});" >> app.js
echo "" >> app.js
echo "app.listen(port, () => {" >> app.js
echo "    console.log(\`The application is currently listening at http://localhost:\${port}\`);" >> app.js
echo "});" >> app.js

echo "app.js has been created successfully."
