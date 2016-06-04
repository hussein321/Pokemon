//
//  ViewController.swift
//  Pokemon
//
//  Created by hoseen on 6/3/16.
//  Copyright © 2016 alone. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    @IBOutlet var collectionView : UICollectionView!
var pokemons = [Poke]()
    var fillterPoke = [Poke]()
    var slideDown = SlideDownTransitionAnimator()
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var inSearchingMode = false
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        searchBar.delegate = self
        parseFromCSVfile()
    }
    
    
    func parseFromCSVfile(){
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: ".csv")!
        do {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            for row in rows {
                let name = row["identifier"]!
                let id = Int(row["id"]!)!
                let poke = Poke(name: name , pokemonId: id)
                pokemons.append(poke)
            }
            
        }catch let err as NSError {
            print(err.debugDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchingMode{
            return fillterPoke.count
        }
        else{
            return 708
        }
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("pokeCell", forIndexPath: indexPath) as? pokemonCell{
            var   pokemon : Poke!
            if inSearchingMode{
                pokemon = fillterPoke[indexPath.row]
                
            }else {
                pokemon = pokemons[indexPath.row]
            }
           
            
            cell.configerPoke(pokemon)
            return cell
            
        }
        else { return UICollectionViewCell()}
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
      
        
        return CGSizeMake(105,105)
    }
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == "" || searchBar.text == nil {
            inSearchingMode = false
            view.endEditing(true)
            collectionView.reloadData()
        }
        else {
            inSearchingMode = true
            let lower = searchBar.text!.lowercaseString
            fillterPoke = pokemons.filter({$0.name.rangeOfString(lower) != nil})
            collectionView.reloadData()
        }
    
    
        }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let pokemon : Poke!
        if inSearchingMode {
            pokemon  = fillterPoke[indexPath.row]
            
        }else {
            pokemon = pokemons[indexPath.row]
        }
        
        performSegueWithIdentifier("pokeDetailView", sender: pokemon)
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "pokeDetailView"{
            let destinationVC = segue.destinationViewController as! pokeDetailView
            if let pokemon = sender as? Poke {
                destinationVC.pokemon = pokemon
            }
            destinationVC.transitioningDelegate = slideDown
            
            
    }

}














}

