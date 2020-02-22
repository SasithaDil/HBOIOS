const express = require("express");
const router = express.Router();

router.get("/", (req, res) => {
  res.send("Avengers Assemble!");
});

module.exports = router;
