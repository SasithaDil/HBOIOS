const express = require('express');

const router = express.Router();

const Cart = require('../models/cart');

router.get('/', (req,res) => {
    
    Cart.find({ })
    .then((data) =>{
        console.log('Data: ', data);
        res.json(data); 
    })
    .catch((error) =>{
        console.log('error: ', error)
    });
    
});

module.exports = router;