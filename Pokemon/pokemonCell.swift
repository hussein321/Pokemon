//
//  pokemonCell.swift
//  Pokemon
//
//  Created by hoseen on 6/4/16.
//  Copyright © 2016 alone. All rights reserved.
//

import UIKit

class pokemonCell: UICollectionViewCell {
    @IBOutlet var PokeImg : UIImageView!
    @IBOutlet var nameLable : UILabel!
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 6
    }
    
    var pokemon : Poke!
    func configerPoke(pokemon :Poke){
        self.pokemon = pokemon
        nameLable.text = self.pokemon.name.capitalizedString
        PokeImg.image = UIImage(named : "\( self.pokemon.pokemonId)")
    }
    
}
