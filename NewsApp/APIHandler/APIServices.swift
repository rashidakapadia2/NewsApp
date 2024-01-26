//
//  APIServices.swift
//  NewsApp
//
//  Created by cirrius on 26/01/24.
//

import Foundation

typealias AnyDict = [String: Any]
typealias AnyDictString = [String: String]

let DEV_ROOT_POINT = "https://newsdata.io/"
let PROD_ROOT_POINT = ""

let contentValue = "application/json"
let contentKey = "Content-Type"

enum NetworkEnvironment: String {
    case development
    case production
}

var networkEnvironment: NetworkEnvironment {
    return .development
}

var BaseURL: String {
    switch networkEnvironment {
    case .development :
        return DEV_ROOT_POINT
    case .production :
        return PROD_ROOT_POINT
    }
}

enum APIServices {
    case newsListing(parameters: AnyDict)
    case newsDetails(parameters: AnyDict)
}

    extension APIServices {
        var Path: String {
            let version = "api/1/"
            var servicePath: String = ""
            switch self {
            case .newsListing: servicePath = "news"
            case .newsDetails: servicePath = "forecast.json"
            }
            
            return BaseURL + version + servicePath
        }
        var parameters: AnyDict? {
               switch self {
               case .newsListing(parameters: let param), .newsDetails(let param) :
                   var finalParams = param
                   finalParams["apikey"] = "pub_3714457337425817f25951adcf415c3d7ad4b"
                   finalParams["language"] = "en"
                   return finalParams
               }
           }
           
           var httpMethod: String {
               switch self {
               default:
                   return "GET"
               }
           }
       }
