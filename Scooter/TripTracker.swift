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
    let SERVER_ADDR = "http://localhost/api"
    let headers: HTTPHeaders = [
        "Content-Type":"application/json; charset=utf-8",
    ]
    
    let uuid: String
    
    init() {
        uuid = UIDevice.current.identifierForVendor?.uuidString ?? "Unable to fetch UUID"
        print("UUID =", uuid)
        print("time(",Date(),")")
        informStart()
    }
    
    func informStart() {
        let action = "start"
        AF.request(SERVER_ADDR + "/trip-records/?deviceId=" + uuid,
                   method: .post, parameters: ["time": Date().ISO8601Format(), "action": action ],
                   encoder: JSONParameterEncoder.default,
                   headers: headers).response { response in
            debugPrint(response)
        }
    }
    
    func informEnd() {
        let action = "end"
        AF.request(SERVER_ADDR + "/trip-records/?deviceId=" + uuid,
                   method: .post, parameters: ["time": Date().ISO8601Format(), "action": action ],
                   encoder: JSONParameterEncoder.default,
                   headers: headers).response { response in
            debugPrint(response)
        }
    }
}


