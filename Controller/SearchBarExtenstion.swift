//
//  SearchBarExtenstion.swift
//  SoftExpertTask
//
//  Created by Youssef on 29/11/2021.
//

import UIKit
extension RecipeSearchVC:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        checkTheValidationOf(searchBarText: searchText)
        if searchBar.text == ""{
            showSuggestions()
        }
    }
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        showSuggestions()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        showSuggestions()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text == ""{
            let alert = UIAlertController(title: "Recipe Name not entered ", message: "you should enter recipe name as english characters", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }else{
            searchedText = searchBar.text!
            let url = ProjectConstants.getURLAsString(recipeName: searchedText, healthFilter: healthFilter)
            print(url)
            BaseAPI.GenericGetResponse(strURL: url, parameters: nil , headers: ProjectConstants.getHeader(healthFilter: healthFilter)) { (status, response:RecipeHead?) in
                if status != 1{
                    let alert = UIAlertController(title: "No result founded", message: "Try to enter another recipe name or check that you are online ", preferredStyle: .actionSheet)
                    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(action)
                    self.present(alert, animated: true) {
                        self.seacrhBarOutlet.text = ""
                        self.showSuggestions()
                    }
                }else{
                    guard let values = response?.hits else {return}
                    self.responseHits = values
                    for item in self.responseHits{
                        self.recipesArr.append(item.recipe!)
                    }
                    DispatchQueue.main.async {
                        self.recipesTable.reloadData()
                    }
                }
            }
        }
    }
}
