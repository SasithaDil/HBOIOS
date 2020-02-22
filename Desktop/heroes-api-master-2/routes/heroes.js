const express = require("express");
const router = express.Router();

const Hero = require("../models/hero")

// var heroesArray = [

// ]

// var heroesArray = [
//   {
//     id: 1,
//     name: "Ranjan",
//     superPowers: ["power1", "power2"],
//     likeCount: 100
//   },
//   {
//     id: 2,
//     name: "Aravinda",
//     superPowers: ["liquorPower", "disappearance"],
//     likeCount: 900
//   },
//   {
//     id: 3,
//     name: "Nisal",
//     superPowers: ["TikTok", "blackmail"],
//     likeCount: 1200
//   },
//   {
//     id: 4,
//     name: "Kemila",
//     superPowers: ["Docker", "Girls"],
//     likeCount: 1200
//   }
// ];
router.get("/", async (req, res) => {
try{
  let heross = await Hero.find({deceased: false}).sort({name:"asc"}).limit(5).select({name:1,deceased:1});
  res.send(heross);
}catch(error){
  // res.send(error);
  return res.status(500).send(error.message)
}
});

router.get("/:heroId", async (req, res) => {
  // let userRquestedId = parseInt(req.params.heroId);
  // let requestedHero = heroesArray.find(h => h.id === userRquestedId);
  // try{
  let heroToEdit = await Hero.findOneAndUpdate({_id:req.params.heroId},
    {$set:{likeCount:20000}}).then(()=>
    {console.log("updated success")})

   
  // let rH = await heroToEdit.save();
// }
  // catch(err){return res.status(500).send(err.message)}

  

  return res.status(200).send(heroToEdit);
});

router.post("/", async (req, res) => {
  /*if (!req.body.name) {
    return res.status(400).send("Please check request again!");
  }*/

  let heroToAdd = new Hero(req.body)

 

// let heroToAdd = new Hero({
//   name : "Hero 1",
//   likeCount : 800,
//   deceased: false
// })

try{
let herocreated = await heroToAdd.save()
res.send(herocreated);
}catch(error){
  // res.send(error);
  return res.status(500).send(error.message)
}
});


// validationErrors = []

// try:
//     jsonschema.validate(jsonFile, schema)
// except jsonschema.exceptions.ValidationError as error:
//     validationErrors.append(error)


router.put("/:heroId", (req, res) => {
  let requestedIdToEdit = parseInt(req.params.heroId);
  if (!req.body.likeCount) {
    return res.status(400).send("Request does not contain all values");
  }

  let heroToEdit = heroesArray.find(h => h.id == requestedIdToEdit);

  if (!heroToEdit) {
    return res.status(404).send("Given Id does not exist");
  }

  heroToEdit.likeCount = req.body.likeCount;
  res.send(heroToEdit);
});

router.delete("/:heroId", (req, res) => {
  let heroToDelete = heroesArray.find(h => h.id == parseInt(req.params.heroId));

  if (!heroToDelete) {
    return res.status(404).send("Given Id does not exist");
  }

  let indexOfHero = heroesArray.indexOf(heroToDelete);
  heroesArray.splice(indexOfHero, 1);
  res.send(heroToDelete);
});

module.exports = router;
