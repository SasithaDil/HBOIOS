import React from 'react';

class App extends React.Component {
  render() {
    return (
      <div className="card" style={{ width: "18rem" }}>
        <img className="card-img-top" src="https://cdn.shopify.com/s/files/1/2517/6496/products/T_55f064d7-e294-4ccf-b528-d1973100b4b1_2400x.jpg?v=1571717481" alt="Card image cap" />
        <div className="card-body">
          <h5 className="card-title">Card title</h5>
          <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
          <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
      </div>
    );
  }
}

export default App;