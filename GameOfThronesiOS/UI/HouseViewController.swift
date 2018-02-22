//
//  HouseCollectionViewController.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 15/12/2017.
//  Copyright © 2017 Giorgos Papadimitriou. All rights reserved.
//
import UIKit
import os.log
import RxSwift
import RxCocoa

class HouseViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var collection: UICollectionView!
    
    //MARKvar Dependencies
    private var viewModel: HouseViewModel!
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    let strings = ["Arryn", "Baratheon", "Greyjoy", "Lannister", "Martell", "Stark", "Targaryen", "Tully", "Tyrell" ]
    
    var houses = [House]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        viewModel = HouseViewModel(houseService: HouseService())
        
        
        // Load the sample data.
        loadHouses()
    }
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.houses.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! HouseCollectionViewCell
        
        // Fetches the appropriate house for the data source layout.
        let house = houses[indexPath.row]
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 8
        cell.myLabel.text = house.name
        cell.image.image = house.photo
        cell.backgroundColor = UIColor.gray // make cell more visible in our example project
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    func loadHouses() {
        // Table view cells are reused and should be dequeued using a cell identifier.
        
        for houseStr in strings {
            let photo = UIImage(named: houseStr)
            guard let house1 = House(name: houseStr, photo: photo) else {
                fatalError("Unable to instantiate house1")
            }
            houses += [house1]
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)

        guard let houseDetailsViewController = segue.destination as? HouseDetailsViewController else {
            fatalError("Unexpected destination: \(segue.destination)")
        }
        
        guard let selectedHouseCollectionViewCell = sender as? HouseCollectionViewCell else {
            fatalError("Unexpected sender: \(sender)")
        }
        
        guard let indexPath = self.collection.indexPath(for: selectedHouseCollectionViewCell) else {
            fatalError("The selected cell is not being displayed by the table")
        }
        
        let selectedHouse = houses[indexPath.row]
        print(selectedHouse.name)
        //os_log(selectedHouse.name, log: OSLog.default, type: .debug)
        houseDetailsViewController.viewModel = self.viewModel
        houseDetailsViewController.viewModel.setNameQuery(nameQuery: selectedHouse.name!)
    }


}
