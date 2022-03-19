//
//  CoverViewController.swift
//  desafio-movies
//
//  Created by FL00027 on 19/03/22.
//

import UIKit

class CoverViewController: UIViewController {

    let cover = ["bat1", "bat2", "duna", "bat1", "bat2", "duna", "bat1", "bat2", "duna", "bat1", "bat2", "duna", "bat1", "bat2", "duna", "bat1", "bat2", "duna", "bat1", "bat2", "duna"]
    
    @IBOutlet weak var collection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate()
        registerCell()
        collectionLayout()
    }
    
    func delegate() {
        
        collection.delegate = self
        collection.dataSource = self
    }
    
    private func registerCell() {
        let nib = UINib(nibName: CollectionViewCellcover.identifier, bundle: nil)
        collection.register(nib, forCellWithReuseIdentifier: CollectionViewCellcover.identifier)
        
    }
    
    private func collectionLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 90, height: 120)
        
        collection.collectionViewLayout = layout
    }
}



extension CoverViewController: UICollectionViewDelegate {
    
}

extension CoverViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cover.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellcover.identifier, for: indexPath) as? CollectionViewCellcover else { return UICollectionViewCell() }
        
        let cove = cover[indexPath.row]
        
        cell.setup(image: cove)
        
        return cell
    }

}
