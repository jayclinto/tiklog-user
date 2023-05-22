
const accountSid = "ACbc32762723e79a7e3ce9c305257c4248";
const authToken = "a8eaa706c417f335b23c91accd2b1545";
const client = require("twilio")(accountSid, authToken);
client.messages
  .create({ body: "Hello from Twilio", from: "+15075007169", to: "+2348146763559" })
  .then(message => console.log(message.sid))
  .catch(err => console.error(err));