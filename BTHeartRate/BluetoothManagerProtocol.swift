//
//  BluetoothManagerProtocol.swift
//  BTHeartRate
//
//  Created on 4/18/16.
//  Copyright © 2016 LynxTip Software. All rights reserved.
//
import CoreBluetooth
import Foundation
import RxSwift

protocol BluetoothManagerProtocol {
    
    var bluetoothState: Variable<BluetoothState> { get }
    
}