//
//  ViewController.swift
//  desafio-list-api
//
//  Created by FL00027 on 21/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataCardApi: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate()
        getDataApi()
    }
    
    func delegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }

    func getDataApi() {
        Service.shared.getByDataCard { [self] result in
            switch result {
            case .success(let res):
                print(res)
                self.dataCardApi = res
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCardApi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TableViewCell else { return UITableViewCell() }
        
        let dataFinal = dataCardApi[indexPath.row]
        
        guard let imageUrl = URL(string: dataFinal.profile) else { return UITableViewCell()}
        
        cell.setup(image: imageUrl, title: dataFinal.name, description: dataFinal.company.name)

        
        return cell
    }
}
