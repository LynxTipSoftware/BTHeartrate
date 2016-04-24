//
//  HeartRateViewModel.swift
//  BTHeartRate
//
//  Created on 4/18/16.
//  Copyright © 2016 LynxTip Software. All rights reserved.
//

import Foundation
import RxSwift

class HeartRateViewModel : HeartRateViewModelProtocol {
    
    private(set) var currentStatus : Observable<ApplicationState>
    
    init (bluetoothManager : BluetoothManagerProtocol) {
        
        
    }

}