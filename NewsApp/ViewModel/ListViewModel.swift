//
//  ListViewModel.swift
//  NewsApp
//
//  Created by cirrius on 26/01/24.
//

import Foundation

protocol ListViewModelProtocol {
    var arrNewsResult: [NewsResult]? { get }
    func fetchNewsData(topic: String?, completion: @escaping (Result<Bool,Error>) -> Void)
}

class ListViewModel: ListViewModelProtocol {
    
    var arrNewsResult: [NewsResult]?
    
    func fetchNewsData(topic: String?, completion: @escaping (Result<Bool,Error>) -> Void) {
        NewsApiService.currentNews(topic: topic ?? "") { result in
            switch result {
            case .success(let model):
                self.arrNewsResult = model.results
                completion(.success(true))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
