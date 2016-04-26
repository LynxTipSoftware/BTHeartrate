//
//  HeartRateViewController.swift
//  BTHeartRate
//
//  Created on 4/18/16.
//  Copyright © 2016 LynxTip Software. All rights reserved.
//

import FontAwesome
import Foundation
import RxSwift
import UIKit

class HeartRateViewController : UIViewController {

    @IBOutlet var buttonBluetooth: UIButton!
    
    var viewModel :HeartRateViewModelProtocol?
    
    let disposeBag = DisposeBag()
    
    private let neutralBTColor = UIColor.grayColor()
    private let warningBTColor = UIColor.orangeColor()
    private let alarmBTColor = UIColor.redColor()
    private let activeBTColor = UIColor.blueColor()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        buttonBluetooth.titleLabel?.font = UIFont.fontAwesomeOfSize(30)
        buttonBluetooth.setTitle(String.fontAwesomeIconWithName(.Bluetooth), forState: .Normal)
        
        // update the bluetooth button based on the bluetooth indication
        self.viewModel!.bluetoothIndication.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribeNext { indication in
                self.updateBluetoothButton(indication)
            }
            .addDisposableTo(disposeBag)
        
        // set initial state
        updateBluetoothButton(self.viewModel!.bluetoothIndication.value)
    }
    
    private func updateBluetoothButton(indication : BluetoothIndication) {
        
        var buttonColor: UIColor
        
        switch indication {
            case .Neutral:
                buttonColor = neutralBTColor
            break
            case .Alarm:
                buttonColor = alarmBTColor
            break
            case .Warning:
                buttonColor = warningBTColor
            break
            case .Active:
                buttonColor = activeBTColor
            break
        }
        
        buttonBluetooth.tintColor = buttonColor
        buttonBluetooth.userInteractionEnabled = false
    }
    
}