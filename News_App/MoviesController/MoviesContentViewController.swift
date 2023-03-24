//
//  MoviesContentViewController.swift
//  News_App
//
//  Created by devsenior on 20/03/2023.
//

import UIKit
import Kingfisher
class MoviesContentViewController: UIViewController {
    
    
    @IBOutlet weak var detailLbl: UILabel!
    
    @IBOutlet weak var imageDetail: UIImageView!
    
    @IBOutlet weak var contentLbl: UITextView!
    
    var newsContent:News!

//    var newsContent:News = a rticles(author = "", title = "", urlToImage = "", content = "")
    override func viewDidLoad() {
        super.viewDidLoad()
        detailLbl.text = newsContent.articles[0].title
        contentLbl.text = newsContent.articles[0].content
        imageDetail.setImage(imageUrl: newsContent.articles[0].urlToImage)
        // Do any additional setup after loading the view.
//        cell.imageNews.setImage(imageUrl: data.articles[indexPath.row].urlToImage)
    }
    

   

}
