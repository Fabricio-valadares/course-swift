//
//  ViewController.swift
//  todolist
//
//  Created by FL00027 on 19/03/22.
//

import UIKit

struct Times {
    var logo: String
    var name: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    
    var arr: [Times] = []
    
    lazy var tarefas = [Tarefa]() {
        didSet {
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        delegates()
//        registerCell()
        
        arr = [Times(logo: "checkmark.rectangle.fill", name: "blala"), Times(logo: "checkmark.rectangle.fill", name: "blala"), Times(logo: "checkmark.rectangle.fill", name: "blala")]
        
    }
    
    private func delegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
//
//    private func registerCell() {
//        let nib = UINib(nibName: ItemTableViewCell.identifier, bundle: nil)
//        tableview.register(nib, forCellWithReuseIdentifier: ItemTableViewCell.identifier)
//    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //    print("Time \(teams[indexPath.row].name)")
    }
}



extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellCustom", for: indexPath) as? ItemTableViewCell else { return UITableViewCell()}
        
        let tar = arr[indexPath.row]
        
        cell.setup(imageLogo: tar.logo, title: tar.name)
        
        
        return cell
    }
}
