//
//  DetailsVC.swift
//  SoftExpertTask
//
//  Created by Youssef on 30/11/2021.
//

import UIKit
import SafariServices
class DetailsVC: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitleLBL: UILabel!
    @IBOutlet weak var recipeIngredientsTextView: UITextView!
    //MARK: - Constants & Variables
    var imageURL:String = ""
    var recipeTitle:String = ""
    var recipeIngriedients:[String] = []
    var publisherWebURL:String = ""
    var sharingURL:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI(){
        self.navigationItem.title = "Recipe Details"
        if #available(iOS 13.0, *) {
            let shareBtn = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(self.shareBtn))
                self.navigationItem.setRightBarButton(shareBtn, animated: true)
        } else {
            let shareBtn = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(self.shareBtn))
                self.navigationItem.setRightBarButton(shareBtn, animated: true)
        }
        recipeImage.setImage(imageURL)
        recipeTitleLBL.text = recipeTitle
        recipeIngredientsTextView.text = "Recipe Ingredients :\n\n"
        for item in recipeIngriedients{
            recipeIngredientsTextView.text += "\(item) \n"
        }
    }
    //MARK: - IBAction
    @IBAction func recipeWebAction(_ sender: UIButton) {
        let safariVC = SFSafariViewController(url: URL(string: publisherWebURL)!)
        self.present(safariVC, animated: true)
    }
    @objc func shareBtn()
    {
        if sharingURL == ""{
            return
        }else{
        let message:String = "Share recipe link "
        guard let shareLink = sharingURL else { return }
        let objectsToShare:URL = URL(string: shareLink)!
        let sharedObjects:[AnyObject] = [objectsToShare as AnyObject,message as AnyObject]
        let activityViewController = UIActivityViewController(activityItems : sharedObjects, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        self.present(activityViewController, animated: true, completion: nil)
        }
    }
}
