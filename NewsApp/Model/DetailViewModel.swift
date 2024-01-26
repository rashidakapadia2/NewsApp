//
//  DetailViewController.swift
//  NewsApp
//
//  Created by cirrius on 26/01/24.
//

import Foundation

protocol DetailViewModelProtocol {
    var weatherQ: String? { get set }
    
    func fetchCurrentWeather(completion: @escaping(Result<CurrentWeatherModel,CustomErrors>) -> Void)
}

class DetailViewModel: CurrentWeatherViewModelProtocol {
    
    
}
