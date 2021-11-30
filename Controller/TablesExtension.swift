//
//  TablesExtension.swift
//  SoftExpertTask
//
//  Created by Youssef on 28/11/2021.
//

import UIKit
extension RecipeSearchVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
        case 1:
            return suggestionsArr.count
        case 2:
            return recipesArr.count
        default:
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView.tag {
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "SuggestionCell")
            cell?.textLabel?.text = suggestionsArr[indexPath.row]
            return cell!
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecipeCell") as! RecipeCell
            cell.recipeImage.setImage(recipesArr[indexPath.row].image ?? "")
            cell.recipeTitle.text = "Recipe Name: \(recipesArr[indexPath.row].label ?? "")"
            cell.source.text = "Source: \(recipesArr[indexPath.row].source ?? "")"
            cell.healthLabels.text = "healthLabels: "
            if let handledHealthLabels = recipesArr[indexPath.row].healthLabels {
                for healthlabel in handledHealthLabels {
                    cell.healthLabels.text += healthlabel+" ,"
                }
            }
            return cell
        default:
            return tableView.dequeueReusableCell(withIdentifier: "SuggestionCell")!
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView.tag {
        case 1:
            return 20
        case 2:
            return ProjectConstants.getScreenHeight()/6
        default:
            return 20
        }
            
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        seacrhBarOutlet.text = suggestionsArr[indexPath.row]
        hideSuggestions()
        switch tableView.tag {
        case 1:
            seacrhBarOutlet.text = suggestionsArr[indexPath.row]
            hideSuggestions()
        case 2:
            if #available(iOS 13.0, *) {
                let detailsVCObject = storyboard?.instantiateViewController(identifier: "DetailsVC") as! DetailsVC
                detailsVCObject.imageURL = recipesArr[indexPath.row].image ?? ""
                detailsVCObject.recipeTitle = recipesArr[indexPath.row].label ?? ""
                detailsVCObject.recipeIngriedients = recipesArr[indexPath.row].ingredientLines ?? []
                detailsVCObject.publisherWebURL = recipesArr[indexPath.row].url ?? ""
                detailsVCObject.sharingURL = recipesArr[indexPath.row].shareAs ?? ""
                self.navigationController?.pushViewController(detailsVCObject, animated: true)
            } else {
                print("not supported version !")
            }
        default:
            print("Table not Existed !")
        }
    }
}
