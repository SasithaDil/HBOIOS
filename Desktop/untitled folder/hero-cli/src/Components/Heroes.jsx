import React, { Component } from "react";
import Hero from "./Hero"
import Axios from "axios";


class Heroes extends Component {
    state = {
        allHeroes: []
    };
    render() {
        return (<div className="container">
            <div className="row">
                {this.state.allHeroes.map(hero => {
                    return (
                        <div key = {hero.id} className="col">
                            <Hero likeCount = {hero.id} heroName={hero.heroName}/>
                            <Hero
                            likeCount = {
                                hero.likeCount,
                                 hero.heroName
                                }
                            
                            />
                        </div>
                    )
                })}

            </div>
        </div>
        );
    }
    async componentDidMount(){
        const {data} = await Axios.get("http://localhost:5000/api/heroes");
        console.log(data);
        let heroes = data.map(hero => {

            return{id: hero._id,
            name: hero.name,
            decreased: hero.decreased
            }
            
        });
        
        this.setState({allHeroes: heroes});
    }
    
}


export default Heroes;