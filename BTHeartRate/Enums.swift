//
//  Enums.swift
//  BTHeartRate
//
//  Created on 4/18/16.
//  Copyright © 2016 LynxTip Software. All rights reserved.
//

import Foundation

enum DeviceType {
    case HeartRateMonitor
}

enum BluetoothState {
    
    // bluetooth state is unknown
    case Unknown
    
    // bluetooth is resetting
    case Resetting
    
    // bluetooth is not supported by the hardware
    case Unsupported
    
    // the app is not authorized to use bluetooth
    case Unauthorized
    
    // bluetooth is turned off
    case PoweredOff
    
    // bluetooth is turned on
    case PoweredOn
    
}

enum BluetoothIndication {
    
    case Neutral
    case Warning
    case Alarm
    case Active
    
}

enum InputError: ErrorType {
    
    // an input argument was nil
    case ArgumentNil
    
}