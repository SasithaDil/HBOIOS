function sendemail(req, res, next) {
  console.log("Sending email to user...");
  next();
}

module.exports = sendemail;
