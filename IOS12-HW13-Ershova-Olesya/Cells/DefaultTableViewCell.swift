//
//  DefaultTableViewCell.swift
//  IOS12-HW13-Ershova-Olesya
//
//  Created by JaloJasela on 29.02.2024.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {
    static let identifier = "DefaultTableViewCell"
    
    private lazy var iconContainer: UIView = {
       let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let Label = UILabel()
        Label.numberOfLines = 0
        return Label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        let imageSize: CGFloat = size / 1.5
        iconImageView.frame = CGRect(x: (size - imageSize) / 2, y: (size - imageSize) / 2, width: imageSize, height: imageSize)
        label.frame = CGRect(x: 25 + iconContainer.frame.size.height, y: 0, width: contentView.frame.size.width - 20 - iconContainer.frame.size.width - 10, height: contentView.frame.size.height)
    }
    
    public func configure(with data: DefaultCellData) {
        label.text = data.text
        iconImageView.image = UIImage(systemName: data.iconName)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        iconContainer.backgroundColor = data.iconBackgroundColor
    }
}
