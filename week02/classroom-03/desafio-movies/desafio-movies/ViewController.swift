//
//  ViewController.swift
//  desafio-movies
//
//  Created by FL00027 on 18/03/22.
//

import UIKit

struct Movies {
    var image: String
    var title: String
    var description: String
}

class ViewController: UIViewController {
        
    @IBOutlet var tableview: UITableView!
    
    var movies: [Movies] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate()
        
        title = "Home"
        
        movies = [Movies(image: "bat1", title: "Batman", description: "Um filme de morcego muito animado, tem de tudo ate palhaço louco."), Movies(image: "bat2", title: "Batman", description: "Um filme de morcego muito animado, tem de tudo ate palhaço louco."), Movies(image: "duna", title: "Duna", description: "Esse e um filme com muita area, isso mesmo areia."), Movies(image: "bat1", title: "Batman", description: "Um filme de morcego muito animado, tem de tudo ate palhaço louco."), Movies(image: "bat1", title: "Batman", description: "Um filme de morcego muito animado, tem de tudo ate palhaço louco."), Movies(image: "bat2", title: "Batman", description: "Um filme de morcego muito animado, tem de tudo ate palhaço louco."),Movies(image: "duna", title: "Duna", description: "Esse e um filme com muita area, isso mesmo areia."), Movies(image: "bat1", title: "Batman", description: "Um filme de morcego muito animado, tem de tudo ate palhaço louco.")]
    }
    
    private func delegate() {
        tableview.delegate = self
        tableview.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "ItemTableCell", for: indexPath) as? ItemTableCell else { return UITableViewCell() }
        
        let moviesFinal = movies[indexPath.row]
        
        
        cell.setup(image: moviesFinal.image, title: moviesFinal.title, description: moviesFinal.description)
        
        return cell
    }
}
