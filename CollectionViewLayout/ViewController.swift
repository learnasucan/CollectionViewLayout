//
//  ViewController.swift
//  CollectionViewLayout
//
//  Created by Prachit on 14/11/23.
//

import UIKit

/// <#Description#>
class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let layout = UICollectionViewFlowLayout()
//        layout.itemSize = CGSize(width: 120, height: 120)
//        layout.minimumLineSpacing = 40 two rows distance
//        layout.minimumInteritemSpacing = 80 two columns distancw
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8) //collectionview outside spacing
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = layout
        
        collectionView.register(CustomCell.nib(), forCellWithReuseIdentifier: CustomCell.identifier)
        
    }


}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else { return  UICollectionViewCell() }
        
        cell.configureCell(name: "add_account")
        
        return cell
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {
//    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
}
