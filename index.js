const express = require('express');

const serverPort = 8000;
const app = express();

app.use('/', (req, res, next) => {
    res.send('microservice-one');
});

app.listen(serverPort, () => {
  console.log(`Service started on port ${serverPort}`);
});
