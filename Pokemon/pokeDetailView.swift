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
    
    @IBOutlet weak var mainImg: UIImageView!
    
    
    @IBOutlet weak var typeLbl: UILabel!
    
    @IBOutlet weak var weightLbl: UILabel!
    
    @IBOutlet weak var heightLbl: UILabel!
    
    @IBOutlet weak var pokeIDlbl: UILabel!
    
    @IBOutlet weak var attckLbl: UILabel!
    
    
    @IBOutlet weak var evuLVLLab: UILabel!
    
    
    @IBOutlet weak var currentlvlImg: UIImageView!
    
    @IBOutlet weak var nextLvLImg: UIImageView!
    var pokemon : Poke!
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLab.text = pokemon.name

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    }
