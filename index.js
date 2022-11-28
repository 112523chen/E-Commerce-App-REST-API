const express = require("express");
const bodyParser = require("body-parser");
require("dotenv").config();

const app = express();
const port = process.env.PORT;
const db = require("./db/index");

app.use(bodyParser.json());
app.use(
  bodyParser.urlencoded({
    extended: true,
  })
);

app.get("/", (req, res, next) => {
  res.json({ test: "PASS" });
});

app.listen(port, () => {
  console.log(`App running on port ${port}.`);
});
