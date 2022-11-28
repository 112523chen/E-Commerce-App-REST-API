const express = require("express");
require("dotenv").config();

const app = express();
const port = process.env.PORT;
const db = require("./db/index");

app.get("/", (req, res, next) => {
  res.json({ test: "PASS" });
});

app.listen(port, () => {
  console.log(`App running on port ${port}.`);
});
