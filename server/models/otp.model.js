const mongoose = require('mongoose');
const Schema = mongoose.Schema;


const otpSchema = new Schema({
  phoneNumber: {
    type: String,
    required: true
  },
  OTPCode: {
    type: String,
    required: true
  },
  OTPExpiration: {
    type: Date,
    required: true
  }
}, { timestamps: true });

module.exports = mongoose.model('OTP', otpSchema);
