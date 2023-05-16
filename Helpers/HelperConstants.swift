//
//  HelperConstants.swift
//  SoftExpertTask
//
//  Created by Youssef on 29/11/2021.
//

import UIKit
import Alamofire
final class ProjectConstants{
    private static let screenWidth = UIScreen.main.bounds.width
    private static let sceenHeight = UIScreen.main.bounds.height
    class func getScreenHeight() -> CGFloat {
        return sceenHeight
    }
    class func getScreenWidth() -> CGFloat {
        return screenWidth
    }
    class func getURLAsString(recipeName:String,healthFilter:String) -> String {
        return "https://api.edamam.com/search?q=\(recipeName)&app_id=e037a3e7&app_key=d1e85f8faa2f58a2659770c6c7811602\(healthFilter)"
    }
    class func getHeader(healthFilter:String) -> [String:String] {
        var header = ["":""]
        if healthFilter == ""{
            header = ["content-type":"application/json"]
        }
        else{
            header = ["content-type":"application/json;charset=UTF-8"]
        }
        return header
    }
    
}
