//
//  pokeDetailView.swift
//  Pokemon
//
//  Created by hoseen on 6/4/16.
//  Copyright © 2016 alone. All rights reserved.
//

import UIKit

class pokeDetailView: UIViewController {
    @IBOutlet weak var nameLab: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    
    @IBOutlet weak var defenseLbl: UILabel!
    
    @IBOutlet weak var typeLbl: UILabel!
    
    @IBOutlet weak var weightLbl: UILabel!
    
    @IBOutlet weak var heightLbl: UILabel!
    
    @IBOutlet weak var pokeIDlbl: UILabel!
    
    @IBOutlet weak var attckLbl: UILabel!
    
    
    @IBOutlet weak var evuLVLLab: UILabel!
    
    
    @IBOutlet weak var currentlvlImg: UIImageView!
    
    @IBOutlet weak var nextLvLImg: UIImageView!
    var pokemon : Poke!
    
    
    
    @IBAction func close(sender: AnyObject) {
        dismissViewControllerAnimated(true , completion: nil)
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLab.text = pokemon.name
        let  img = UIImage(named: "\(pokemon.pokemonId)")
        mainImg.image = img
        
          currentlvlImg.image = img
        
        pokemon.downloadData {
            //print("is done")
            self.updateUI()
            
        }

        // Do any additional setup after loading the view.
    }
    
    
    
    func updateUI() {
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        pokeIDlbl.text = "\(pokemon.pokemonId)"
        weightLbl.text = pokemon.weight
        attckLbl.text = pokemon.attack
        
        if pokemon.nextEvolutionId == "" {
            evuLVLLab.text = "No Evolutions"
            nextLvLImg.hidden = true
        } else {
            nextLvLImg.hidden = false
            nextLvLImg.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            
            if pokemon.nextEvolutionLvl != "" {
                str += " - LVL \(pokemon.nextEvolutionLvl)"
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    }
