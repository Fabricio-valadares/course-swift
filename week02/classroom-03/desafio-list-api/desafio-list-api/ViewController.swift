//
//  ViewController.swift
//  desafio-list-api
//
//  Created by FL00027 on 21/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var dataCardApi = [Card]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate()
        getDataApi()
    }
    
    func delegate() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.isHidden = true
        
    }
    
    func getDataApi() {
        Service.shared.getByDataCard { [self] result in
            switch result {
            case .success(let res):

                self.dataCardApi = res
                
                DispatchQueue.main.async {
                    self.tableView.isHidden = false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataCardApi.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        let dataFinal = self.dataCardApi[indexPath.row]
        
        cell.setup(image: dataFinal.photo, title: dataFinal.name, description: dataFinal.company.name)
        
        return cell
    }
}


