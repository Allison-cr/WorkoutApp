//
//  MonthlyPerfomanceView.swift
//  tried
//
//  Created by Alexander Suprun on 08.01.2024.
//

import Foundation
import UIKit

final class MonthlyPerfomanceView: WABaseInfoView {

    private let chartsView = WAChartsView()

    func configure(with items: [WAChartsView.Data], topChartOffset: Int) {
        chartsView.configure(with: items, topChartOffset: topChartOffset)
    }
}

extension MonthlyPerfomanceView {
    override func setupViews() {
        super.setupViews()

        setupView(chartsView)
    }

    override func constraintViews() {
        super.constraintViews()

        NSLayoutConstraint.activate([
            chartsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            chartsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            chartsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            chartsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
        ])
    }

    override func configureAppearance() {
        super.configureAppearance()
        
    }
}
