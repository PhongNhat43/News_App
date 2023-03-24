//
//  APIHandler.swift
//  News_App
//
//  Created by devsenior on 19/03/2023.
//

import Foundation
import Alamofire


class APIHandler {
   static let sharedInstance = APIHandler()
    
    func fetchingAPIData(handler: @escaping (_ apiData:[News2])-> (Void) ){
      let url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ad732c7302a7418dabdf4bc3b98bad75"
    
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response { response in
            switch response.result {
            case.success(let data):
                do {
                    let jsondata = try JSONDecoder().decode([News2].self, from: data!)
                    handler(jsondata)
                  }catch {
                      print(error.localizedDescription)
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
        
        
        }
    
    }
}

struct News2: Codable {
    let articles: [Articles]
  
}


struct Articles: Codable {
    var author: String
    var title: String
    var urlToImage: String
    var content: String

}
