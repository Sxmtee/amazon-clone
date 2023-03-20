//IMPORTS FROM PACKAGES
const express = require("express");
const mongoose = require("mongoose");

//IMPORTS FROM OTHER FILES
const authRouter = require("./routes/auth");

//INIT
const app = express();
const PORT = 3000;
const DB =
  "mongodb+srv://sxmtee:Ugonnaya76@cluster0.bjtb1vj.mongodb.net/?retryWrites=true&w=majority";

//middleware
app.use(express.json());
app.use(authRouter);

//connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("connection successful");
  })
  .catch((e) => {
    console.log(e);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
