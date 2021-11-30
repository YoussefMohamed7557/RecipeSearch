//
//  HealthFiltersExtension.swift
//  SoftExpertTask
//
//  Created by Youssef on 29/11/2021.
//

import UIKit

extension RecipeSearchVC:UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return healthFiltersArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HealthFilterCell", for: indexPath) as! HealthFilterCell
        cell.filterName.text = healthFiltersArr[indexPath.row]
        return cell
    }
    //
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width * 0.28 - 4, height: collectionView.bounds.height - 4)
    }
    //
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath)! as! HealthFilterCell
        selectedCell.cellBackgroundView.backgroundColor = UIColor.green
        switch indexPath.row {
        case 0:
            healthFilter = ""
        case 1:
            healthFilter = "&health=low-sugar"
        case 2:
            healthFilter = "&health=keto-friendly"
        case 3:
            healthFilter = "&health=vegan"
        default:
            healthFilter = ""
        }
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let desSlectedCell = collectionView.cellForItem(at: indexPath)! as! HealthFilterCell
        if #available(iOS 13.0, *) {
            desSlectedCell.cellBackgroundView.backgroundColor = UIColor.systemGray6
        } else {
            // Fallback on earlier versions
            desSlectedCell.cellBackgroundView.backgroundColor = UIColor(red:CGFloat(239), green: CGFloat(239), blue: CGFloat(239), alpha: CGFloat(1))
        }
        
    }
 
}
