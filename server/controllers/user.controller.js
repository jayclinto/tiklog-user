const User = require("../models/user.model");
const bcrypt = require('bcryptjs');
const uuid = require('uuid');
//const OTP = require('../models/otp.model');


//twilio declration
const accountSid = "ACbc32762723e79a7e3ce9c305257c4248";
const authToken = "a8eaa706c417f335b23c91accd2b1545";
const twilio = require("twilio")(accountSid, authToken);


const twilioPhoneNumber = '+15075007169';
const messageBody = 'Your OTP code is: ';

// Define your OTP generation function
function generateOTP() {
  const digits = '0123456789';
  let OTP = '';
  for (let i = 0; i < 6; i++) {
    OTP += digits[Math.floor(Math.random() * 10)];
  }
  return OTP;
}

// Define your OTP sending function
function sendOTP(phoneNumber, OTP) {
  const message = messageBody + OTP;
  twilio.messages.create({
    body: message,
    from: twilioPhoneNumber,
    to: phoneNumber
  }).then(message => console.log(message.sid))
    .catch(err => console.error(err));
}






exports.register = async (req, res) => {
 const {  phoneNumber, password } = req.body
   
  if (password.length < 6) {
      return res.status(400).json({ message: "Password should be up to 6 charcters" })
  }
    
  try {
      const user = await  User.findOne({phoneNumber: phoneNumber});
      if(user == null){ 

      const OTPCode = generateOTP();
        sendOTP(phoneNumber, OTPCode)
        
        // Store the user data and OTP in the session
      req.session.user = { phoneNumber, password, OTPCode };
      res.send('OTP sent. Please verify your phone number. ${phoneNumber}');
   
  } 
  else{
        res.json({message: 'Phone Number already exists!' });
  }
}
    catch (err) {
      
      console.log(err);
      res.status(401).json({
        message: "User not successful created",
        error: err.mesage,
      });
    }
  }


  exports.verifyOtp = async (req, res) => {

    const { OTPCode } = req.body;
      try{
        const { phoneNumber, password } = req.session.user;

        if (req.session.user.OTPCode !== OTPCode) {

          res.status(400).send('Invalid OTP');
        }else{

          // OTP verification successful, create the user 

          const salt = await bcrypt.genSalt(10);
              
            const hashedPassword=  await bcrypt.hash(password, salt);
      
            const uniqueId = uuid.v4();
      
            const user = new User({
              uniqueId,
              phoneNumber,
              password: hashedPassword,
              wallet: null
            });

              // Save the user to the database
              user.save().then(async (error) => {
                if(error){
                 console.log(error);
                res.json(error);
                }else{
                  console.log(user);
                  res.json(user);
                  
                }}); 
              res.send('User registered successfully');
          
         }
      
     }catch (err){

    }

  
  }
  



  exports.login = async (req, res, next) => {
    const { phoneNumber, password } = req.body
    
    try {
        const user = await User.findOne({ phoneNumber: phoneNumber })
        if (!user) {
          res.status(401).json({
            message: "Login not successful",
            error: "User not found",
          })
        }
        if (await bcrypt.compare(password, user.password)) {
            res.status(200).json({
                message: "Login successful",
                user,
              });
              res.json(user);
        }else {
            response.json({message: 'User does not exist!' });
        }
      } catch (error) {
        res.status(400).json({
          message: "An error occurred",
          error: error.message,
        })
      }
  }