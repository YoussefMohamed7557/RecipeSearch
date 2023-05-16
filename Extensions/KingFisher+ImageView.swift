//
//  KingFisher+ImageView.swift
//  SoftExpertTask
//
//  Created by Youssef on 30/11/2021.
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView{
    
    func setImage(_ strULR: String){
        
        guard let handllingURL = (strULR).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {return}
        
        guard let imageURL = URL(string: handllingURL) else {return}
        
        self.kf.indicatorType = .activity
        
        self.kf.setImage(with: imageURL,
                            placeholder: UIImage(named: "burger_male") ,
                            options: [.transition(.fade(0.8))]
        )
    }
}
