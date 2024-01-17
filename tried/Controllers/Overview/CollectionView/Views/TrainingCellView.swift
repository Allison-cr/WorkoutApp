//
//  TrainingCellView.swift
//  tried
//
//  Created by Alexander Suprun on 11.01.2024.
//

import UIKit

enum CellRoundedType {
    case top, bottom, all, notRounded
}

final class TrainingCellView: UICollectionViewCell {
    static let id = "TrainingCellView"
    
    private let checkmarkView = UIImageView(image: Resources.Images.OverView.checkmarkNotDone)
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 3
        return view
    }()
    
    private let title : UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvelticaRegular(with: 17)
        label.textColor = Resources.Colors.titleGray
        return label
    }()
    
    private let subtitle : UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.helvelticaRegular(with: 13)
        label.textColor = Resources.Colors.inactive
        return label
    }()
    
    private let rightArrowView = UIImageView(image: Resources.Images.OverView.rightArrow)
    
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
    
    func configure(with title: String, subtitle: String, isDone: Bool, roundedType: CellRoundedType) {
        self.title.text = title
        self.subtitle.text = subtitle
        
        checkmarkView.image = isDone ? Resources.Images.OverView.checkmarkDone : Resources.Images.OverView.checkmarkNotDone
        
        switch roundedType {
        case .top:
            self.roundCorners([.allCorners], radius: 5)
        case .bottom:
            self.roundCorners([.bottomLeft,.bottomRight], radius: 5)
        case .all:
            self.roundCorners([.topLeft,.topRight], radius: 5)
        case .notRounded:
            self.roundCorners([.allCorners], radius: 0)
        }
    }
}

private extension TrainingCellView {
    
    func setupViews() {
        setupView(checkmarkView)
        setupView(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subtitle)
        setupView(rightArrowView)
    }
    
    func constraintViews() {
        NSLayoutConstraint.activate([
            checkmarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            checkmarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkmarkView.heightAnchor.constraint(equalToConstant: 28),
            checkmarkView.widthAnchor.constraint(equalTo: checkmarkView.heightAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: checkmarkView.trailingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: rightArrowView.leadingAnchor, constant: -15),
            
            rightArrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            rightArrowView.heightAnchor.constraint(equalToConstant: 12),
            rightArrowView.widthAnchor.constraint(equalToConstant: 7),

            
        ])
    }
    
    func configureApperance() {
        
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = Resources.Colors.separator.cgColor
    }
}
