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
router.post('/save', (req,res) => {
    const data = req.body;

    const newCart = new Cart(data);

    newCart.save((error) => {
        if(error) {
            res.status(500).json({msg:'sorry, internal server error..'});
            return;
        }
        return res.json({
            msg: 'Your data has been saved...!!!'
        });
    });

});

module.exports = router;