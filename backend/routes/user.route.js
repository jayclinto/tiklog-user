const express = require("express");
const router = express.Router();
const { register,verifyOtp, login } = require("../controllers/user.controller");




router.route("/signup").post(register);
router.route("/verify-otp").post(verifyOtp);
router.route("/signin").post(login);

module.exports = router;



