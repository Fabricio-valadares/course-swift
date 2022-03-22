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
        
        self.ImageV.layer.cornerRadius = 10
        self.ImageV.clipsToBounds = true
       
    }
    
    func setup(image: String, title: String, description: String) {
        ImageV.loadImage(from: image)
        TitleV.text = title
        DescriptionV.text = description
    }

}

extension UIImageView {
  
    func loadImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

        let cache =  URLCache.shared
        let request = URLRequest(url: imageURL)
      
        DispatchQueue.global(qos: .userInitiated).async {
            if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.transition(toImage: image)
                }
            } else {
                URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                    if let data = data, let response = response, ((response as? HTTPURLResponse)?.statusCode ?? 500) < 300, let image = UIImage(data: data) {
                        let cachedData = CachedURLResponse(response: response, data: data)
                        cache.storeCachedResponse(cachedData, for: request)
                        DispatchQueue.main.async {
                            self.transition(toImage: image)
                        }
                    }
                }).resume()
            }
        }
    }
  
    func transition(toImage image: UIImage?) {
        UIView.transition(with: self, duration: 0.2,
                          options: [.transitionCrossDissolve],
                          animations: {
                            self.image = image
        },
                          completion: nil)
    }
}
