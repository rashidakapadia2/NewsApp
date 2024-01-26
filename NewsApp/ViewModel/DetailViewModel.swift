//
//  DetailViewController.swift
//  NewsApp
//
//  Created by cirrius on 26/01/24.
//

import Foundation

protocol DetailViewModelProtocol {
    var result: NewsResult? { get }
}

class DetailViewModel: DetailViewModelProtocol {
    var result: NewsResult?
    
    init(result: NewsResult?) {
        self.result = result
    }
}
