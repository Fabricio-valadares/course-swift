//
//  messageUser.swift
//  whatsapp
//
//  Created by FL00027 on 25/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var tableview: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // --------------
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        
           navigationController?.navigationBar.prefersLargeTitles = true

           let appearance = UINavigationBarAppearance()
           appearance.backgroundColor = .white
           appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
           appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]

           navigationController?.navigationBar.tintColor = .black
           navigationController?.navigationBar.standardAppearance = appearance
           navigationController?.navigationBar.compactAppearance = appearance
           navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
   }
    // --------------

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Chats"
        view.backgroundColor = .gray

        tableview.delegate = self
        tableview.dataSource = self
        
        view.addSubview(tableview)
        
        tableview.delegate = self
        tableview.dataSource = self
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        tableview.register(TableViewCellHome.self, forCellReuseIdentifier: TableViewCellHome.identifier)
    }
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let messageViewController = MessageViewController()

        if let _ = navigationController {
            navigationController?.pushViewController(messageViewController, animated: true)
        } else {
            present(messageViewController, animated: true)
        }
        
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellHome.identifier, for: indexPath) as? TableViewCellHome else {
            return UITableViewCell()
        }
        
        return cell
    }
}
