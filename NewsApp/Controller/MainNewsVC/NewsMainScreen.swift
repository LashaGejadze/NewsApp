//
//  ViewController.swift
//  NewsApp
//
//  Created by macosx on 06.07.17.
//  Copyright © 2017 macosx. All rights reserved.
//

import UIKit

class NewsMainScreen: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    // Mark: NewsData
    var newsData = [dataObject]()
    
    ///MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchinfo() //fetch information
        
    }
    
    //MARK: - IBAction
    @IBAction func SearchButtonTapped(_ sender: UIButton) {
        let searchVC = self.storyboard?.instantiateViewController(withIdentifier: "xxSearchxx");self.navigationController?.pushViewController(searchVC!, animated: true)
    }
  
    func fetchinfo(){
        
        for i in 1..<5{
            
            let object = dataObject()
            
            object.image = UIImage(named: "pic\(i)")
            object.textfield = "საქართველოს 19-წლამდელთა ნაკრები ევროპის ჩემპიონატის ნახევარფინალში ვერ გავიდა"
            object.date = "1\(i).06.2017"
            object.title = "NewsApp"
            newsData.append(object)
    }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
       
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.reloadData()
        
    }
    
    
}
//MARK: - UITableViewDelegate,UITableViewDataSource
extension NewsMainScreen: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        guard let tableCell = tableView.dequeueReusableCell(withIdentifier: "qqTableCellpp", for: indexPath) as? NewsTableCell else{
            fatalError("Could not dequeue cell with identifier qqTableCellpp")
    }
        
        let object = newsData[indexPath.row]
        
        tableCell.tableImage.image = object.image
        tableCell.tableLabel.text = object.date
        tableCell.tableText.text = object.textfield
    
        return tableCell
    }
    
    
}
//MARK: - UICollectionViewDelegate,UICollectionViewDataSource
extension NewsMainScreen: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return newsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let items = collectionView.dequeueReusableCell(withReuseIdentifier: "qqCollectionCellpp", for: indexPath) as? NewsCollectionCell else{
            fatalError("Could not dequeue cell with identifier qqCollectionCellpp")
    }
        

        let object = newsData[indexPath.row]
        
        items.collLabel.text = object.title
        
        
        
        return items
        
    }
    
    
    
}




