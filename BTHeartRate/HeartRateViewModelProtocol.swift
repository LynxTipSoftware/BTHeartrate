//
//  HeartRateViewModelProtocol.swift
//  BTHeartRate
//
//  Created on 4/18/16.
//  Copyright © 2016 LynxTip Software. All rights reserved.
//

import Foundation
import RxSwift

protocol HeartRateViewModelProtocol {
    
    var currentStatus : Observable<ApplicationState> { get }
    
}