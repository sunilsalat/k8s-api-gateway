const express = require('express');


const app = express();
const PORT = 3000;

app.get('/', (req, res) => {
  res.send('Hello from Core Service!');
});

app.get("/health", (req, res) => {
  res.status(200).send("OK!");
});

app.listen(PORT, () => {
  console.log(`Service B is running on port ${PORT}`);
});