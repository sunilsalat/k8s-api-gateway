const express = require("express");

const app = express();
const PORT = 3001;

app.get("/", (req, res) => {
  res.send("Hello from Interface Service!");
});

app.get("/health", (req, res) => {
  res.status(200).send("OK");
});

app.get("/test", (req, res) => {
  res.status(200).send("Test");
});

app.listen(PORT, () => {
  console.log(`Service B is running on port ${PORT}`);
});
