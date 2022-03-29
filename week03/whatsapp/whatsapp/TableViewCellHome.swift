//
//  TableViewCell.swift
//  whatsapp
//
//  Created by FL00027 on 25/03/22.
//

import UIKit

class TableViewCellHome: UITableViewCell {

    static let identifier = "TableViewCellHome"
    
    lazy var profile: UIImageView = {
        let imageProfile = UIImageView()
        imageProfile.image = UIImage(named: "profile")
        imageProfile.contentMode = .scaleAspectFit
        imageProfile.tintColor = .cyan
        imageProfile.translatesAutoresizingMaskIntoConstraints = false

        return imageProfile
    }()
    
    lazy var stackView: UIStackView = {
        let stackVertical = UIStackView()
        stackVertical.axis = .vertical
        stackVertical.alignment = .top
        stackVertical.spacing = 10
        stackVertical.translatesAutoresizingMaskIntoConstraints = false
        return stackVertical
    }()
    
    lazy var nameUser: UILabel = {
        let name = UILabel()
        name.textColor = .black
        name.font = UIFont.systemFont(ofSize: 17)
        name.text = "Gabriel junior"
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    lazy var messagePreview: UILabel = {
        let message = UILabel()
        message.textColor = .lightGray
        message.text = "Sim, podemos marcar nosso encontro"
        message.numberOfLines = 0
        message.font = UIFont.systemFont(ofSize: 14)
        message.translatesAutoresizingMaskIntoConstraints = false
        return message
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(profile)
        
        NSLayoutConstraint.activate([
            profile.widthAnchor.constraint(equalToConstant: 60),
            profile.heightAnchor.constraint(equalToConstant: 80),
            profile.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            profile.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: profile.trailingAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
        
        
        stackView.addArrangedSubview(nameUser)
        stackView.addArrangedSubview(messagePreview)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }



}
