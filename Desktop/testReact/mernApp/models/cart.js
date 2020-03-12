const mongoose = require('mongoose');


const Schema = mongoose.Schema;
const cartSchema = new Schema({
    title: String,
    price: String,
    date: {
        type: String,
        default: Date.now()
    }
});

const Cart = mongoose.model('cart', cartSchema);

module.exports = Cart; 