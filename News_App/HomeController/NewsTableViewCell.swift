//
//  NewsTableViewCell.swift
//  News_App
//
//  Created by devsenior on 17/03/2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    static let identifier = "NewsTableViewCell"
       
    @IBOutlet weak var imageNews: UIImageView!
    
    @IBOutlet weak var titleLbNews: UILabel!
    
//    @IBOutlet weak var arthorLbNNews: UILabel!
    
   
    static func nib() -> UINib {
       return UINib(nibName: "NewsTableViewCell", bundle: nil)
    }
    
   

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
