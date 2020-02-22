import React, { Component } from "react";

class Hero extends Component {
    state = {
        heroId: 120,
        heroName: this.props.heroName,
        movies: ['m1', 'm2'],
        likeCount: this.props.likeCount
        //  imgUrl: this.props.imgUrl
    };
    render() {
        return (

            // <React.Fragment>
            // <h1 style = {{color: "red", fontSize:"30px"}}>Hero Component ...{this.isHero()} </h1> 
            // <h3>Hero Id is {this.state.heroId} </h3> 
            // <button className="btn btn-primary"> Click </button>
            // </React.Fragment>


            <div className="card" style={{ width: "18rem" }}>
                <img className="card-img-top" src="https://www.dw.com/image/50340387_303.jpg" alt="Card image cap" />
                <div className="card-body">
        <h5 className="card-title">{this.state.heroName}</h5>
                    <p className="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.
                    </p>
                    <ul>
                        <li>SP 1</li>
                        <li>SP 2</li>
                        <li>SP 3</li>

                    </ul>
                    <p>movies</p>
                    <ul>

                        {this.showMovie()}
                    </ul>

                    <center><button className="btn btn-primary" onClick={() =>this.likeAvenger(1)}>Like Avenger ->{" "} 
                    <span className="badge badge-light">{this.state.likeCount}</span>
                    </button></center>
                </div>

            </div>

        );
    };

    likeAvenger = counter => {
        console.log("You have like the super hero..");
        this.setState({likeCount: this.state.likeCount + counter});


    }

    showMovie() {

        if (this.state.movies.length === 0) return <p>no movies available</p>;
        return this.state.movies.map(movies => (<li key={this.state.movies.indexOf(movies)}>{movies}</li>));
    }
    /* isHero(){
        // if (this.state.heroId<1000){return "Avenger";
        // }
        //  else {
        //      return " Not Avenger";
        //     }

            return (this.state.heroId<1000) ? "Avenger" : "Not an Avenger";
    }
} */}
export default Hero;

