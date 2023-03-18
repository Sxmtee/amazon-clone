//IMPORTS FROM PACKAGES
const express = require("express");

//IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");

//INIT
const app = express();
const PORT = 3000;

//middleware
app.use(authRouter);

//CREATING AN API
//Get, Put, Post, Delete, Update -> CRUD

app.listen(PORT, () => {
  console.log(`connected at port ${PORT}`);
});
