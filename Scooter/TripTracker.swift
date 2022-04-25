//
//  TripTracker.swift
//  Scooter
//
//  Created by Zitan Chen on 4/23/22.
//

import Foundation
import UIKit
import Alamofire


class TripTracker {
    let SERVER_ADDR = "http://54.208.68.184/api"
    let headers: HTTPHeaders = [
        "Content-Type":"application/json; charset=utf-8",
    ]
    
    let uuid: String
    static private var sharedInstance: TripTracker? = nil
    static public var singleton: TripTracker {
        get {
            if sharedInstance == nil {
                sharedInstance = TripTracker()
            }
            return sharedInstance!
        }
    }
    
    init() {
        uuid = UIDevice.current.identifierForVendor?.uuidString ?? "Unable to fetch UUID"
    }
    
    func startTrip() {
        let action = "start"
        AF.request(SERVER_ADDR + "/trip-records/?deviceId=" + uuid,
                   method: .post, parameters: ["time": Date().ISO8601Format(), "action": action ],
                   encoder: JSONParameterEncoder.default,
                   headers: headers).response { response in
            debugPrint(response)
        }
    }
    
    func endTrip() {
        let action = "end"
        AF.request(SERVER_ADDR + "/trip-records/?deviceId=" + uuid,
                   method: .post, parameters: ["time": Date().ISO8601Format(), "action": action ],
                   encoder: JSONParameterEncoder.default,
                   headers: headers).response { response in
            debugPrint(response)
        }
    }
}


