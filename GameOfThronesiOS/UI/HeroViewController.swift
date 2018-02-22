//
//  HeroViewController.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 15/12/2017.
//  Copyright © 2017 Giorgos Papadimitriou. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import RxSwift
import RxCocoa
import RxAlamofire

//MARK: -
//MARK: - HeroViewController
final class HeroViewController: UIViewController {
    
    //MARK: - Dependencies
    private var viewModel: HeroViewModel!
    private let disposeBag = DisposeBag()
    
    //MARK: - Outlets
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroTitles: UILabel!
    @IBOutlet weak var heroCultureLabel: UILabel!
    @IBOutlet weak var heroRank: UILabel!
    @IBOutlet weak var heroHouseImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        viewModel = HeroViewModel(heroService: HeroService())
        addBindsToViewModel(viewModel: viewModel)
    }
    
    //MARK: - Lifecycle
    private func addBindsToViewModel(viewModel: HeroViewModel) {
        
        viewModel.fetch()
            .subscribeOn(MainScheduler.asyncInstance)
            .observeOn(MainScheduler.instance)
            .flatMapLatest({ (hero) -> Observable<UIImage> in
                
                print(hero.culture as Any)
                self.heroNameLabel.text = hero.name
                self.heroTitles.text = hero.titles?.joined(separator: ", ")
                self.heroCultureLabel.text = hero.culture
                self.heroRank.text = String(describing: hero.pageRank!)
                
                //let houseImageStr = hero.house.components(separatedBy: " ")
                
                
                return viewModel.fetchImage(imageUrl: "https://api.got.show"+hero.imageLink!)
            })
            .subscribe(onNext: {image in
                print(image)
                self.heroImageView.image = image
            })
            .disposed(by: disposeBag)
        
        
//        viewModel.fetchImage(imageUrl: "https://api.got.show/misc/images/characters/Jon_Snow.jpeg")
//            .subscribeOn(MainScheduler.asyncInstance)
//            .observeOn(MainScheduler.instance)
//            //.map({$0})
//            .subscribe(onNext: {image in
//                print(image)
//                self.heroImageView.image = image
//            })
//            .disposed(by: disposeBag)
//
////        cityTextField.rx_text
////            .bindTo(viewModel.searchText)
////            .addDisposableTo(disposeBag)
//
//        viewModel.heroName
//            .bind(to: heroNameTextfield.rx.text)
//            .disposed(by: disposeBag)
//
//        viewModel.heroCulture
//            .bind(to: heroCultureLabel.rx.text)
//            .disposed(by: disposeBag)
//
//        viewModel.her
//            .bind(to: heroNameTextfield.rx.text)
//            .disposed(by: disposeBag)
    }

}

