//
//  SectionHeaderView.swift
//  tried
//
//  Created by Alexander Suprun on 11.01.2024.
//

import Foundation
import UIKit

final class SectionHeaderView: UICollectionReusableView {
    static let id = "SectionHeaderView"
    
    private let title : UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvelticaRegular(with: 13)
        label.textColor = Resources.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintViews()
        configureApperance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupViews()
        constraintViews()
        configureApperance()
    }
    
    func configure(with date: Date) {
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEEE, MMMM, dd"
    
        self.title.text = dateFormater.string(from: date).uppercased()
    }
}

private extension SectionHeaderView {
    
    func setupViews() {
        setupView(title)
    }
    
    func constraintViews() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configureApperance() {}
}
