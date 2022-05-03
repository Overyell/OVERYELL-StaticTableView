//
//  TableViewCellFive.swift
//  OVERYELL-StaticTableView
//
//  Created by Benjamin Skomrock on 05/2022
//  Copyright © 2022 Overyell.com. All rights reserved.
//

import UIKit

class TableViewCellFive: UITableViewCell {
    static let identifier = "TableViewCellFive"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        return label
    }()
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let mySegmentControl: UISegmentedControl = {
        let myItems = ["ONE", "TWO", "THREE"]
        let mySegmentControl = UISegmentedControl(items: myItems)
        mySegmentControl.selectedSegmentTintColor = .black
        mySegmentControl.backgroundColor = .tertiarySystemBackground
        mySegmentControl.addTarget(self, action: #selector(ViewController.segmentValueChangedFive(_:)), for: .valueChanged)
        mySegmentControl.translatesAutoresizingMaskIntoConstraints = false
        return mySegmentControl
    }()
    
    /// SETUP: TableViewCell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        contentView.addSubview(mySegmentControl)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size: CGFloat = contentView.frame.size.height - 12
        iconContainer.frame = CGRect(x: 15, y: 6, width: size, height: size)
        
        let imageSize: CGFloat = size/1.5
        iconImageView.frame = CGRect(x: (size-imageSize)/2, y: (size-imageSize)/2, width: imageSize, height: imageSize)
        
        label.frame = CGRect(x: 25 + iconContainer.frame.size.width,
                             y: 0,
                             width: contentView.frame.size.width - 20 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height)
        
        mySegmentControl.sizeToFit()
        mySegmentControl.frame = CGRect(x: (contentView.frame.size.width - mySegmentControl.frame.size.width) - 20,
                                        y: (contentView.frame.size.height - mySegmentControl.frame.size.height)/2,
                                        width: mySegmentControl.frame.size.width,
                                        height: mySegmentControl.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
        iconImageView.image = nil
        iconImageView.tintColor = nil
        iconContainer.backgroundColor = nil
        mySegmentControl.isSelected = false
    }

    public func configure(with model: SettingsFive) {
        label.text = model.title
        iconImageView.image = model.icon
        iconImageView.tintColor = model.iconColor
        iconContainer.backgroundColor = model.iconBackgroundColor
        mySegmentControl.isSelected = model.isSelected
    }
} /// END OF CLASS
