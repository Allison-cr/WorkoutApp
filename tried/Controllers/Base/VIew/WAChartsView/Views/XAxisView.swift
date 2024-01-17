//
//  XAxisView.swift
//  tried
//
//  Created by Alexander Suprun on 08.01.2024.
//

import Foundation
import UIKit

final class XAxisView: WABaseView{
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .equalSpacing
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]) {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        data.forEach{
            let label = UILabel()
            label.font = Resources.Fonts.helvelticaRegular(with: 9)
            label.textColor = Resources.Colors.inactive
            label.textAlignment = .center
            label.text = $0.title.uppercased()// TODO: - remake to calculated interval
            
            stackView.addArrangedSubview(label)
        }
    }
}



extension XAxisView {
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
