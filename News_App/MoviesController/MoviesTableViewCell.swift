//
//  MoviesTableViewCell.swift
//  News_App
//
//  Created by devsenior on 20/03/2023.
//

import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    static let identifier = "MoviesTableViewCell"
       
    @IBOutlet weak var imageNews: UIImageView!
    
    @IBOutlet weak var titleLbNews: UILabel!
    
//    @IBOutlet weak var arthorLbNNews: UILabel!
    
   
    static func nib() -> UINib {
       return UINib(nibName: "MoviesTableViewCell", bundle: nil)
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
