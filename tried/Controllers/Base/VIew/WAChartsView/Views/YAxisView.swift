//
//  YAxisView.swift
//  tried
//
//  Created by Alexander Suprun on 08.01.2024.
//

import Foundation
import UIKit

final class YAxisView: WABaseView{
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]) {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        (0...9).reversed().forEach{
            let label = UILabel()
            label.font = Resources.Fonts.helvelticaRegular(with: 9)
            label.textColor = Resources.Colors.inactive
            label.textAlignment = .right
            label.text = "\($0 * 10)" // TODO: - remake to calculated interval
            
            stackView.addArrangedSubview(label)
        }
    }
}



extension YAxisView {
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)
        
    }
    
    override func constraintViews() {
        super.constraintViews()

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}
