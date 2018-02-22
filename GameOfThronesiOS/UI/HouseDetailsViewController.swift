//
//  HouseDetailsViewController.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 16/12/2017.
//  Copyright © 2017 Giorgos Papadimitriou. All rights reserved.
//
import UIKit
import Alamofire
import AlamofireObjectMapper
import RxSwift
import RxCocoa
import RxAlamofire
import os.log

class HouseDetailsViewController: UIViewController {
    
    //MARK: - Dependencies
    var viewModel: HouseViewModel!
    private let disposeBag = DisposeBag()
    
    //MARK: - Outlets

    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var houseTitleLabel: UILabel!
    @IBOutlet weak var housePhoto: UIImageView!
    @IBOutlet weak var houseCoatOfArmsLabel: UILabel!
    @IBOutlet weak var houseLordLabel: UILabel!
    @IBOutlet weak var houseRegionLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //viewModel = HouseViewModel(houseService: HouseService())

        print(viewModel.getNameQuery())
        viewModel.fetch()
        self.housePhoto.image = UIImage(named: viewModel.getNameQuery())
        addBindsToViewModel(viewModel: viewModel)
    }

    //MARK: - Lifecycle
    private func addBindsToViewModel(viewModel: HouseViewModel) {

        viewModel.houseName
            .bind(to: houseNameLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.houseTitle
            .bind(to: houseTitleLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.houseCoatOfArms
            .bind(to: houseCoatOfArmsLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.houseLord
            .bind(to: houseLordLabel.rx.text)
            .disposed(by: disposeBag)

        viewModel.houseRegion
            .bind(to: houseRegionLabel.rx.text)
            .disposed(by: disposeBag)
    }

}
