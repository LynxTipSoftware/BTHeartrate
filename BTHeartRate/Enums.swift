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

enum ApplicationState {
    
    case Starting
    case BTStateUnknown
    case BTStateResetting
    case BTStateUnsupported
    case BTStateUnauthorized
    case BTStatePoweredOff
    case Scanning
    case Connecting
    case Connected
    
}