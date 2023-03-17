const express = require("express");
const app = express();
const PORT = 3000;

//CREATING AN API
//Get, Put, Post, Delete, Update -> CRUD
app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT}`);
});