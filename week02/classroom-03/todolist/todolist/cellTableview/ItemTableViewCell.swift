//
//  ItemTableViewCell.swift
//  todolist
//
//  Created by FL00027 on 19/03/22.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var titleV: UILabel!
    
    static let identifier = "ItemTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(imageLogo: String, title: String) {
        print(imageLogo)
        
//        if let imageLogo = UIImage(systemName: imageLogo) {
//            imageV.image = imageLogo
//        }

        imageV.image = UIImage(systemName: imageLogo)
        titleV.text = title
    }
}
