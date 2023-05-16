//
//  ViewController.swift
//  SoftExpertTask
//
//  Created by Youssef on 28/11/2021.
//

import UIKit

class RecipeSearchVC: UIViewController {
    //MARK:- Constants & Variable
    var healthFilter = ""
    var searchedText:String = ""
    var suggestionsArr:[String] = ["chicken","chicken","chicken","chicken","chicken","chicken","chicken","chicken","chicken","chicken"]
    
    @IBOutlet weak var healthFilterCollectionView: UICollectionView!
    var healthFiltersArr:[String] = ["All","low Sugar","Keto","Vegan"]
    var responseHits:[Hit] = []
    var recipesArr:[Recipe] = []
    //MARK:- IBOutlets
    @IBOutlet weak var searchSuggestionsTable: UITableView!
    @IBOutlet weak var suggestionTableHeight: NSLayoutConstraint!
    @IBOutlet weak var seacrhBarOutlet: UISearchBar!
    @IBOutlet weak var recipesTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        defaultSettings()
    }
    //MARK: - Helper Method
    func defaultSettings() {
        hideSuggestions()
        healthFilterCollectionView.register(UINib(nibName: "HealthFilterCell", bundle: nil), forCellWithReuseIdentifier: "HealthFilterCell")
        recipesTable.register(UINib(nibName: "RecipeCell", bundle: nil), forCellReuseIdentifier: "RecipeCell")
    }
    func showSuggestions() {
        suggestionTableHeight.constant = 200
    }
    func hideSuggestions() {
        suggestionTableHeight.constant = 1
    }
    func checkTheValidationOf(searchBarText:String){
        if seacrhBarOutlet.text == "" {
            return
        }else if searchBarText == " "{
            seacrhBarOutlet.text = ""
        }else if !(isEnglishCaracterOrSpace(lastEnteredChar: searchBarText.last!)){
            let alert = UIAlertController(title: "Not valid character", message: "The last character is not english character or space", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default) { (_) in
                self.seacrhBarOutlet.text?.removeLast()
                self.showSuggestions()
            }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }else{
            hideSuggestions()
        }
    }
}
func isEnglishCaracterOrSpace(lastEnteredChar:Character) -> Bool{
    if lastEnteredChar == " " {
        return true
    }
    switch lastEnteredChar.asciiValue! {
    case 65...90 :
        return true
    case 97...122 :
        return true
    default:
        return false
    }
}
