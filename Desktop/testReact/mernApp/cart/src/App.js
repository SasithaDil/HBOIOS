import React from 'react';
import axios from 'axios';

import './App.css';

class App extends React.Component {
  state = {
    title: '',
    description: '',
    img:'',
    price: '',
    qty:'',
    posts: [],
    product:[]
  };

  componentDidMount = () => {
    this.getCart();
  }

  getCart = () => {
    axios.get('/api')
      .then((response) => {
        const data = response.data;
        this.setState({ posts: data })
        console.log('Data has been received...');
      })
      .catch(() => {
        alert('Error retreiving data...!!!')
      });
  };

  handleChange = ({ target }) => {
    const { name, value } = target;
    // const target = event.target;
    // const name = target.name;
    // const value = target.value;

    this.setState({
      [name]: value,
    });
  };

  submit = (event) => {
    event.preventDefault();

    const payload = {
      title: this.state.title,
      price: this.state.price,
      description: this.state.description
    };

    axios({
      url: '/api/save ',
      method: 'POST',
      data: payload
    })
      .then(() => {
        console.log('Data has been sent to the server...');
        this.resetUserInputs();
        this.getCart();
      })
      .catch(() => {
        console.log('Internal server error...');
      });;
  };

  resetUserInputs = () => {
    this.setState({
      title: '',
      price: '',
      img:'',
      description: ''
    });
  };

  addTocart = (post) => {
    console.log(post.title);
    
    this.setState({
      title:post.title,
      price:post.price,
        })

  } 
  calTotal = ({ target }) => {
    const { name, value } = target;
    
    const tot = value * this.state.price

    this.setState({
      [name]: tot,
    });
  };

  displayCart = (posts) => {
    if (!posts.length) return null;

    return posts.map((post, index) => (

      <div key={index} className="card" style={{ width: "60rem"}} >
        <table><tr><td width = "300px">
        <img className="card-img-left" src={post.img} alt="Card image cap" style={{ width: "16rem", marginRight: "15px", marginBottom: "15px"}}/>
        </td><td width = "300px">
        
          <h3>{post.title}</h3>
        <h6>{post.description}</h6>
        <h5>Rs. {post.price}/=</h5>
       </td><td width = "150px">
        <a onClick={this.addTocart.bind(this, post)} className="btn btn-warning float-right">Add to cart</a>
        </td></tr></table>
      </div>
     
      

    ));
  };

  render() {

    console.log('state', this.state);

    return (
      <div><center><table ><tr>
        <td>
          <h2>S h o p i f i r e</h2></td>
        <td>
          <img src="https://i.ya-webdesign.com/images/shopping-clipart-model-16.png" alt="logo" height="80px" width="80px" />
        </td>
      </tr>
        <br /><br />
        </table>
        
        <div className="col">
        {this.displayCart(this.state.posts)}
        </div></center>
        <hr/>
        

        <table class="table">
  <thead>
    <tr>
      <th scope="col">Item</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Total</th>
    </tr>
  </thead>
  <tbody>
    <tr>
    <th scope="row">{this.state.title}</th>
      <td>{this.state.price}</td>
      <td> <input 
      type = "text" 
      name = "qty"
      defaultValue = "1"
      onChange = {this.calTotal}
      style={{ width: "60px", marginRight: "10px", borderRadius: "4px"}}/>
      </td>
    <td>{this.state.qty}</td>
    </tr>
  </tbody>
</table>

       
       
      </div>
    );
  }
}

export default App;