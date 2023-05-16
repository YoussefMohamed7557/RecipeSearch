//
//  APICallGeneric.swift
//  SoftExpertTask
//
//  Created by Youssef on 29/11/2021.
//

import UIKit
import Alamofire

class BaseAPI {
    
    class func GenericGetResponse<T: Codable>(strURL: String, parameters: [String:Any]?, headers: [String:String]?, completion: @escaping (_ status: Int, _ response: T?) -> Void){
        
        guard let url = URL(string: strURL) else {return}
        
        var AlamoHeaders: HTTPHeaders? = nil
        if headers != nil{
            AlamoHeaders = HTTPHeaders(headers!)
        }
        
        
        AF.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: AlamoHeaders).responseJSON { (response) in
            
            switch response.result{
                
            case .success(_):
                
                guard let data = response.data else {return}
                
                do{
                    let results = try JSONDecoder().decode(T.self, from: data)
                    completion(1,results)
                    
                }catch{
                    print(error)
                    completion(0,nil)
                }
                
            case .failure(_):
                print(response.error ?? "")
                completion(0,nil)
            }
        }
    }
}
