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
