//
//  News.swift
//  News_App
//
//  Created by devsenior on 17/03/2023.
//

import Foundation
import HandyJSON

class News: HandyJSON {
    
    var status = ""
    var articles = [Articles]()
    required init() {}
}

class Articles: HandyJSON {
    
    var author = ""
    var title = ""
    var urlToImage = ""
    var content = ""
    
    required init() {}

}


