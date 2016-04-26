//
//  BluetoothManager.swift
//  BTHeartRate
//
//  Created on 4/18/16.
//  Copyright © 2016 LynxTip Software. All rights reserved.
//

import CoreBluetooth
import Foundation
import RxSwift

class BluetoothManager : NSObject {
    
    private(set) var bluetoothState = Variable(BluetoothState.Unknown)
    
    private var centralManager: CBCentralManager!

    override init() {
        
        super.init()

        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    private func getBluetoothState() -> BluetoothState {
        
        switch self.centralManager.state {
        case .PoweredOff:
            return .PoweredOff
        case .PoweredOn:
            return .PoweredOn
        case .Resetting:
            return .Resetting
        case .Unauthorized:
            return .Unauthorized
        case .Unknown:
            return .Unknown
        case .Unsupported:
            return .Unsupported
        }
    }
    
}

extension BluetoothManager: BluetoothManagerProtocol {

}

extension BluetoothManager: CBCentralManagerDelegate {
    
    @objc func centralManagerDidUpdateState(central: CBCentralManager) {
        
        bluetoothState.value = getBluetoothState()
        
    }
}