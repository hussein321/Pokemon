//
//  Poke.swift
//  Pokemon
//
//  Created by hoseen on 6/4/16.
//  Copyright © 2016 alone. All rights reserved.
//

import Foundation
import Alamofire
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
    private var _nextEvolutionId: String!
    private var _nextEvolutionLvl: String!
    private var _pokemonUrl: String!
 
    
    
    
    
    
    var name : String {
        return _name
    }
    var pokemonId : Int {
    return _pokemonId
    }
    
    
    
    
    var nextEvolutionLvl: String {
        get {
            if _nextEvolutionLvl == nil {
                _nextEvolutionLvl = ""
            }
            return _nextEvolutionLvl
        }
    }
    
    var nextEvolutionTxt: String {
        
        if _nextEvolutionTxt == nil {
            _nextEvolutionTxt = ""
        }
        
        return _nextEvolutionTxt
    }
    
    var nextEvolutionId: String {
        
        if _nextEvolutionId == nil {
            _nextEvolutionId = ""
        }
        return _nextEvolutionId
    }
    
    var description: String {
        
        if _descrption == nil {
            _descrption = ""
        }
        return _descrption
    }
    
    var type: String {
        if _type == nil {
            _type = ""
        }
        return _type
    }
    
    var defense: String {
        if _defense == nil {
            _defense = ""
        }
        return _defense
    }
    
    var height: String {
        if _heigt == nil {
            _heigt = ""
        }
        return _heigt
    }
    
    var weight: String {
        if _weight == nil {
            _weight = ""
        }
        return _weight
    }
    
    var attack: String {
        if _attck == nil {
            _attck = ""
        }
        return _attck
    }
    

    init (name: String, pokemonId: Int){
        _name = name
        _pokemonId = pokemonId
        
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokemonId)/"
    }
    
    
    
    
    
    
    func downloadData(downloadComplate : DownloadComplate){
        
        let url = NSURL(string: _pokemonUrl)!
     Alamofire.request(.GET, url).responseJSON { (
        response) in
        
        
        let result = response.result
        
        if let dict = result.value as? Dictionary<String,AnyObject> {
            if let weight = dict["weight"] as? String{
                self._weight = weight
            }
            if let height = dict["height"] as? String {
                self._heigt = height
            }
            if let attack = dict["attack"] as? Int {
                self._attck = "\(attack)"
            }
            
            if let defense = dict["defense"] as? Int{
                self._defense = "\(defense)"
                
            }
//            print(self._weight)
//            print(self._defense)
//            print(self._heigt)
//            print(self._attck)
            
            if let types = dict["types"] as? [Dictionary<String,AnyObject>] where types.count > 0 {
                if let type = types[0]["name"] as? String {
                    self._type = type
                    
                    if types.count > 1 {
                        for var x = 1; x < types.count ; x++ {
                            if let name = types[x]["name"] as? String{
                                self._type! += "/\(name)"
                                
                            }
                      }
                    }
                    
                }
                print(self._type)
                
            }else {
                self._type = ""
            }
            if let descArr = dict["descriptions"] as? [Dictionary<String, String>] where descArr.count > 0 {
                
                if let url = descArr[0]["resource_uri"] {
                    let nsurl = NSURL(string: "\(URL_BASE)\(url)")!
                    
                    Alamofire.request(.GET, nsurl).responseJSON { response in
                        
                        let desResult = response.result
                        if let descDict = desResult.value as? Dictionary<String, AnyObject> {
                            
                            if let description = descDict["description"] as? String {
                                self._descrption = description
                                print(self._descrption)
                            }
                        }
                        
                        downloadComplate()
                    }
                }
                
            } else {
                self._descrption = ""
            }
            
            
            if let evolutions = dict["evolutions"] as? [Dictionary<String,AnyObject>] where evolutions.count > 0{
                
                if let to = evolutions[0]["to"] as? String {
                    
                    //Can't support mega pokemon right now but
                    //api still has mega data
                    if to.rangeOfString("mega") == nil {
                        
                        if let uri = evolutions[0]["resource_uri"] as? String {
                            
                            let newStr = uri.stringByReplacingOccurrencesOfString("/api/v1/pokemon/", withString: "")
                            
                            let num = newStr.stringByReplacingOccurrencesOfString("/", withString: "")
                            
                            self._nextEvolutionId = num
                            self._nextEvolutionTxt = to
                            
                            if let lvl = evolutions[0]["level"] as? Int {
                                self._nextEvolutionLvl = "\(lvl)"
                            }
                            
                            print(self._nextEvolutionId)
                            print(self._nextEvolutionTxt)
                            print(self._nextEvolutionLvl)
                        }
                    }
                }
            }

            
        }
        

        }
        
    }
    
}
