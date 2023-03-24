//
//  CoinTableViewCell.swift
//  API_Demo2
//
//  Created by devsenior on 16/03/2023.
//

import UIKit

class CoinTableViewCell: UITableViewCell {
    
    static let identifier = "CoinTableViewCell"
    
    @IBOutlet weak var updated: UILabel!
    
    @IBOutlet weak var updatedISO: UILabel!
    
    @IBOutlet weak var updateduk: UILabel!
    
    @IBOutlet weak var disclaimer: UILabel!
    
    @IBOutlet weak var chartName: UILabel!
    
    @IBOutlet weak var USD: UILabel!
    
    @IBOutlet weak var code: UILabel!
    
    @IBOutlet weak var symbol: UILabel!
    
    @IBOutlet weak var rate: UILabel!
    
    @IBOutlet weak var descriptionLB: UILabel!
    
    @IBOutlet weak var rate_float: UILabel!
    static func nib() -> UINib {
          return UINib(nibName: "CoinTableViewCell", bundle: nil)
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
