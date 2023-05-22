
const mongoose = require('mongoose');
const Schema = mongoose.Schema;



const userSchema = new Schema({
    uniqueId: {
        type: String,
        required: true,
        unique: true,
    },
    phoneNumber: {
        type: String,
        required: true
    },
    password: {
        type: String,
        minlength: 6,
        required: true
    },
 
    emailAddress: String,
    firstName: String,
    lastName: String,
    country: String,
    state: String,
    city: String,
    homeAddress: String,
    officeAddress: String,
    sex: String,
    image: String,
    errands: Number,
    export: Number,
    wallet: Boolean,
    walletId: String,
    ratings: Number,
    reports: Number,
    created_at: {
        type: Date,
        default: Date.now
    },
    updated_at: {
        type: Date,
        default: Date.now
    },


});



module.exports = mongoose.model('User', userSchema);

