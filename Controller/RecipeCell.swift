//
//  RecipeCell.swift
//  SoftExpertTask
//
//  Created by Youssef on 29/11/2021.
//

import UIKit

class RecipeCell: UITableViewCell {
    
    @IBOutlet weak var cellBackgroundView: UIView!{
        didSet{
            cellBackgroundView.backgroundColor = UIColor.green.withAlphaComponent(0.3)
        }
    }
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var source: UILabel!
    @IBOutlet weak var healthLabels: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
