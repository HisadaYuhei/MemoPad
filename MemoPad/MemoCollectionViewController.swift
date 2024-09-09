//
//  MemoCollectionViewController.swift
//  MemoPad
//
//  Created by 久田　悠平 on 2024/08/30.
//

import UIKit

class MemoCollectionViewController: UIViewController, UICollectionViewDataSource{
    @IBOutlet var collectionView: UICollectionView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var titles: [String] = []
    var contents: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        saveData.register(defaults: ["title":[],"content":[]])
        titles = saveData.object(forKey: "titles") as! [String]
        contents = saveData.object(forKey: "contents") as! [String]
        collectionView.dataSource = self
        
        let configuration = UICollectionLayoutListConfiguration(appearance: .plain)
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout.list(using: configuration)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        var contentConfiguration = UIListContentConfiguration.cell()
        
        contentConfiguration.text = titles[indexPath.item]
        contentConfiguration.secondaryText = contents[indexPath.item]
        cell.contentConfiguration = contentConfiguration
        
        return cell
    }
    
    
}
