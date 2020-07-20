//
//  NewsCell.swift
//  RxNewsApp
//
//  Created by MAHIMA on 20/07/20.
//  Copyright © 2020 MAHIMA. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    //MARK:- IBOutlets
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK:- Overridden Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
