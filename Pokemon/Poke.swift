//
//  Poke.swift
//  Pokemon
//
//  Created by hoseen on 6/4/16.
//  Copyright © 2016 alone. All rights reserved.
//

import Foundation
class Poke {
    
    private var _name : String!
    private var _pokemonId : Int!
    private var _descrption : String!
    private var _attck : String!
    private var _type :String!
    private var _defense :String!
    private var _weight : String!
    private var _heigt : String!
    private var _nextEvolutionTxt : String!
    
    
    
    
    
    var name : String {
        return _name
    }
    var pokemonId : Int {
    return _pokemonId
    }
    init (name: String, pokemonId: Int){
        _name = name
        _pokemonId = pokemonId
    }
    
}
