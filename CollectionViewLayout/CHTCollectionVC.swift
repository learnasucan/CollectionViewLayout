//
//  CHTCollectionVC.swift
//  CollectionViewLayout
//
//  Created by Prachit on 14/11/23.
//

import UIKit
import CHTCollectionViewWaterfallLayout

struct Images {
    let name: String
    let height: CGFloat
    
}
class CHTCollectionVC: UIViewController,CHTCollectionViewDelegateWaterfallLayout {

    private let collectionView: UICollectionView = {
       
        let layout = CHTCollectionViewWaterfallLayout()
        layout.columnCount = 2
        layout.itemRenderDirection = .leftToRight
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //register with cell
        view.register(InstaImageCell.self, forCellWithReuseIdentifier: InstaImageCell.identifier)
        return view
    }()
    
    private var imageList: [Images] = [Images]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let images = (1...8).map { "\($0)" }
        
        imageList = images.compactMap {
            Images.init(name: $0, height: CGFloat.random(in: 200...400))
        }
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
}

extension CHTCollectionVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InstaImageCell.identifier, for: indexPath) as? InstaImageCell else {
            fatalError()
        }
        
        let imageObject = imageList[indexPath.item]
        cell.configure(imageObject)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let imageObject = imageList[indexPath.item]
        return CGSize(width: view.frame.size.width / 2, height: imageObject.height)
    }
    
}
