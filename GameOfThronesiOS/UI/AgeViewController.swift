//
//  AgeViewController.swift
//  GameOfThronesiOS
//
//  Created by Giorgos Papadimitriou on 26/12/2017.
//  Copyright © 2017 Giorgos Papadimitriou. All rights reserved.
//

import UIKit
import ISTimeline
import RxSwift
import RxCocoa


class AgeViewController: UIViewController {
    //MARK: - Dependencies
    private var viewModel: AgeViewModel!
    private let disposeBag = DisposeBag()
    
    //MARK: - Outlets
    @IBOutlet weak var timeline: ISTimeline!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = AgeViewModel(ageService: AgeService())
        
        
        viewModel.fetch()
            .subscribeOn(MainScheduler.asyncInstance)
            .observeOn(MainScheduler.instance)
            .flatMap({ (ages) -> Observable<[ISPoint]> in
                let black1 = UIColor.black
                
                let touchAction1 = { (point:ISPoint) in
                    print("point \(point.title)")
                }
                
                var myPoints = [ISPoint]()
                
                for item in ages {
                    
                    let startDate = String(describing: item.startDate)  ?? ""
                    
                    myPoints += [ISPoint(title: item.name!, description: "From: "+startDate + " - To: "+String(describing: item.endDate!), pointColor: black1, lineColor: black1, touchUpInside: touchAction1, fill: false)]
                    print(myPoints)
                }
                
                return Observable.from(myPoints)
            })
            .subscribe(onNext: {points in
                self.timeline.contentInset = UIEdgeInsetsMake(20.0, 20.0, 20.0, 20.0)
                self.timeline.points = points
            })
            .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
