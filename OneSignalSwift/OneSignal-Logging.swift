//
//  OneSignal-Logging.swift
//  OneSignalSwift
//
//  Created by Joseph Kalash on 6/22/16.
//  Copyright © 2016 OneSignal. All rights reserved.
//

import Foundation

extension OneSignal {
    
    public static func setLogLevel(_ nslogLevel : ONE_S_LOG_LEVEL, visualLevel visualLogLevel : ONE_S_LOG_LEVEL) {
        self.nsLogLevel = nslogLevel
        self.visualLogLevel = visualLogLevel
    }
    
    public static func onesignal_Log(_ logLevel : ONE_S_LOG_LEVEL, message : String) {
        
        var levelString = ""
        
        switch logLevel {
            case .one_S_LL_FATAL: levelString = "FATAL: "
            case .one_S_LL_ERROR: levelString = "ERROR: "
            case .one_S_LL_WARN: levelString = "WARN: "
            case .one_S_LL_INFO: levelString = "INFO: "
            case .one_S_LL_DEBUG: levelString = "DEBUG: "
            case .one_S_LL_VERBOSE: levelString = "VERBOSE: "
            default: break
        }

        if logLevel.rawValue <= nsLogLevel.rawValue && nsLogLevel != .one_S_LL_NONE  { print("\(levelString)\(message)")}
        
        if logLevel.rawValue <= visualLogLevel.rawValue && visualLogLevel != .one_S_LL_NONE {
            let alert = UIAlertView(title: levelString, message: message, delegate: nil, cancelButtonTitle: "Close")
            alert.show()
        }
        
    }
    
}
