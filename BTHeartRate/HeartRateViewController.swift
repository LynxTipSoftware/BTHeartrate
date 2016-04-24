//
//  HeartRateViewController.swift
//  BTHeartRate
//
//  Created on 4/18/16.
//  Copyright © 2016 LynxTip Software. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

class HeartRateViewController : UIViewController {
    
    @IBOutlet var labelStatus: UILabel!
    
    private var viewModel : HeartRateViewModelProtocol?
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // create the view model
        if self.viewModel == nil {
            self.viewModel = HeartRateViewModel()
        }
        
        // update the status label based on the application state
        self.viewModel!.currentStatus
            .observeOn(MainScheduler.instance)
            .subscribeNext { status in
                self.labelStatus.text = "\(status)"
            }
            .addDisposableTo(disposeBag)
        
    }
    
    
    
}