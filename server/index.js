const express = require('express')
const app = express();

const port = process.env.PORT || 8000
app.use(express.json()); // Parse incoming JSON data
app.use(express.urlencoded({ extended: true }));

const databaseConnection = require("./src/connections/conn");

databaseConnection.connect()

//route import
const userRoute =require('./src/routes/user_route')

app.use("/user", userRoute);


app.listen(port, () => {
    console.log("Backend server is running!", port);
  });