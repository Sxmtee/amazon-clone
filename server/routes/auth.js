const express = require("express");
const User = require("../models/usermodel");
const bcryptjs = require("bcryptjs");
const authRouter = express.Router();
const jwt = require("jsonwebtoken");

authRouter.get("", function (req, res) {
  res.send("I am Smxtee!");
});

//SIGN-UP ROUTE
authRouter.post("/api/signup", async (req, res) => {
  //get data from client
  try {
    const { name, email, password } = req.body;

    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exists!" });
    }

    const hashedPwd = await bcryptjs.hash(password, 8);

    let user = new User({
      name,
      email,
      password: hashedPwd,
    });
    user = await user.save();
    res.json(user);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

//SIGN-IN ROUTE
authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await User.findOne({ email });
    if (!user) {
      return res
        .status(400)
        .json({ msg: "User with this email does not exist" });
    }

    const isMatch = await bcryptjs.compare(password, user.password);
    if (!isMatch) {
      return res.status(400).json({ msg: "Incorrect password" });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

module.exports = authRouter;
