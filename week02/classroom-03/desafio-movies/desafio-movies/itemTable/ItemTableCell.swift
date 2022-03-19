//
//  ItemTableCell.swift
//  desafio-movies
//
//  Created by FL00027 on 18/03/22.
//

import UIKit

class ItemTableCell: UITableViewCell {
    
    @IBOutlet weak var ImageV: UIImageView!
    
    @IBOutlet weak var TitleV: UILabel!
    
    @IBOutlet weak var DescriptionV: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setup(image: String, title: String, description: String) {
        ImageV.image = UIImage(named: image)
        TitleV.text = title
        DescriptionV.text = description
    }
}
