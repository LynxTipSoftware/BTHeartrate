//
//  HeartRateViewModel.swift
//  BTHeartRate
//
//  Created on 4/18/16.
//  Copyright © 2016 LynxTip Software. All rights reserved.
//

import CoreBluetooth
import Foundation
import RxSwift

class HeartRateViewModel : HeartRateViewModelProtocol {
    
    private(set) var bluetoothIndication = Variable(BluetoothIndication.Neutral)
    
    private var bluetoothManager : BluetoothManagerProtocol
    private let disposeBag = DisposeBag()
    
    init (bluetoothManager : BluetoothManagerProtocol) {
                
        self.bluetoothManager = bluetoothManager
        
        // update the bluetooth button based on the bluetooth indication
        self.bluetoothManager.bluetoothState.asObservable()
            .observeOn(MainScheduler.instance)
            .subscribeNext { state in
                self.updateBluetoothIndication(state)
            }
            .addDisposableTo(disposeBag)
        
        // set initial state
        updateBluetoothIndication(self.bluetoothManager.bluetoothState.value)
    }
    
    private func updateBluetoothIndication(state: BluetoothState) {
        
        var indication: BluetoothIndication
        
        switch state {
            case .PoweredOff, .Unauthorized:
                indication = .Warning
                break
            case .PoweredOn:
                indication = .Active
                break
            case .Unsupported:
                indication = .Alarm
                break
            default:
                indication = .Neutral
                break
        }
        
        bluetoothIndication.value = indication
        
    }

}