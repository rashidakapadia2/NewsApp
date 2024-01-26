//
//  NewsApiService.swift
//  NewsApp
//
//  Created by cirrius on 26/01/24.
//

import Foundation

func jSONDecoding<T: Decodable>(jSON: Data) -> Result<T,Error>{
    do {
        let jsonDecoder = JSONDecoder()
        let responseData = try jsonDecoder.decode(T.self, from: jSON)
        return .success(responseData)
    } catch let error {
        debugPrint(error.localizedDescription)
        return .failure(error)
    }
}

class NewsApiService {
    
    static func currentNews(topic: String, completion: @escaping(Result<NewsModel,CustomErrors>) -> Void) {
        let params = ["q": topic]
        APIManager.sharedInstance.performRequest(serviceType: .newsListing(parameters: params)){
            (response) in
            switch response {
            case .success(let value):
                if let content = value {
                    do {
                        let responseData = try JSONDecoder().decode(NewsModel.self, from: content)
                        completion(.success(responseData))
                    } catch {
                        print(error)
                    }
                }
                else{
                    print("\(String(describing: CustomErrors.noData.errorDescription))")
                }
            case .failure(let error):
                print("In Failure")
                debugPrint(error.localizedDescription)
                print("Wrong pass")
                completion(.failure(CustomErrors.genericErr))
            }
        }
    }
    
//    static func forecast(days: Int = 3, weatherQ: String, completion: @escaping(Result<ForecastModel,CustomErrors>) -> Void) {
//        let params: [String:Any] = ["q": weatherQ, "days": days, "lang": lang]
//        APIManager.sharedInstance.performRequest(serviceType: .forecast(parameters: params)){
//            (response) in
//            switch response {
//            case .success(let value):
//                if let content = value {
//                    do {
//                        let responseData = try JSONDecoder().decode(ForecastModel.self, from: content)
//                        completion(.success(responseData))
//                    } catch {
//                        print(error)
//                    }
//                }
//                else{
//                    print("\(String(describing: CustomErrors.noData.errorDescription))")
//                }
//            case .failure(let error):
//                print("In Failure")
//                debugPrint(error.localizedDescription)
//                print("Wrong pass")
//                completion(.failure(CustomErrors.genericErr))
//            }
//        }
//    }
//    
}
