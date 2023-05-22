
require('dotenv').config();
const express = require('express');
const session = require('express-session');
const MongoStore = require('connect-mongo');

const app = express();



const port = 8080 || process.env.PORT;
const cors = require('cors');
const bodyParser = require('body-parser');

const mongoose = require('mongoose');

const uri = "mongodb+srv://jayclinton15:rootZwxj2619!@cluster0.1kalnmf.mongodb.net/?retryWrites=true&w=majority";

async function connect(){
    try{
         await mongoose.connect(uri, {useNewUrlParser: true, useUnifiedTopology: true})
        
        console.log('connected Database');
        
    } catch (error){
        console.error(error);

    }
}
connect();


   
  
    app.use(session({
      secret: 'your_secret_key',
      resave: false,
      saveUninitialized: true,
      store: new MongoStore({
        mongoUrl: uri,
        ttl: 60 * 60, // session will expire in 1 hour
      }),
    }));

  


  
  
  
  
  





app.use(cors());
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());




app.use('/root/api/auth', require('./routes/user.route'));





app.listen(port, ()=> {
    console.log('port running on '+port);
});