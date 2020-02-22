function authenticate(req, res, next) {
  console.log("Authenticating user ...");
  next();
}

module.exports = authenticate;
