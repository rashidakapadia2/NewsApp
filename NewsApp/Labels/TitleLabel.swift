//
//  TitleLabel.swift
//  NewsApp
//
//  Created by cirrius on 11/02/24.
//

import Foundation
import UIKit

class TitleLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
    }
    
    private func configure() {
        textColor = .label
        adjustsFontSizeToFitWidth = false
        minimumScaleFactor = 0.9
        numberOfLines = 0
        lineBreakStrategy = .standard
        translatesAutoresizingMaskIntoConstraints = false
    }
}
