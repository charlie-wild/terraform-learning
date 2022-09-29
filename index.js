const serverless = require('serverless-http');
const bodyParser = require("body-parser");
const express = require('express');
const cors = require("cors");
const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.options('*', cors());

app.listen(3001, () => {
  console.log("Server started on port 3001");
});
 
app.get('/hello', (req, res) => {
  res.send('Hello World!');
})
 
module.exports.handler = serverless(app);