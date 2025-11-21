const express = require('express');


const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
  res.send('Hello from Service A!');
});

app.listen(PORT, () => {
  console.log(`Service B is running on port ${PORT}`);
});