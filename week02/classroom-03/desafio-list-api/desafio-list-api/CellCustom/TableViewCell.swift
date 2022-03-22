//
//  TableViewCell.swift
//  desafio-list-api
//
//  Created by FL00027 on 21/03/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var ImageV: UIImageView!
    
    @IBOutlet weak var TitleV: UILabel!
    
    @IBOutlet weak var DescriptionV: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(image: URL, title: String, description: String) {
        ImageV.image = UIImage(systemName: "home")
        TitleV.text = title
        DescriptionV.text = description
    }

}
