//
//  DetailViewController.swift
//  News_App
//
//  Created by devsenior on 19/03/2023.
//

import UIKit
import Kingfisher
class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var detailLbl: UILabel!
    
    @IBOutlet weak var imageDetail: UIImageView!
    
    @IBOutlet weak var contentLbl: UILabel!
    
    var newsContent:News!

//    var newsContent:News = a rticles(author = "", title = "", urlToImage = "", content = "")
    override func viewDidLoad() {
        super.viewDidLoad()
//        detailLbl.text = newsContent.articles[0].title
//        contentLbl.text = newsContent.articles[0].content
//        imageDetail.setImage(imageUrl: newsContent.articles[0].urlToImage)
        for articles in newsContent.articles {
            detailLbl.text = articles.title
            contentLbl.text = articles.content
            imageDetail.setImage(imageUrl: articles.urlToImage)
        
        }
        // Do any additional setup after loading the view.
//        cell.imageNews.setImage(imageUrl: data.articles[indexPath.row].urlToImage)
    }
    

   

}
