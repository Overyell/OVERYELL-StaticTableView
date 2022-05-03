//
//  TableViewCellSix.swift
//  OVERYELL-StaticTableView
//
//  Created by Benjamin Skomrock on 05/2022
//  Copyright © 2022 Overyell.com. All rights reserved.
//

import UIKit

class TableViewCellSix: UITableViewCell {
    static let identifier = "TableViewCellSix"
    
    let mySegmentControl: UISegmentedControl = {
        let myItems = ["ONE", "TWO", "THREE", "FOUR", "FIVE"]
        let mySegmentControl = UISegmentedControl(items: myItems)
        mySegmentControl.selectedSegmentTintColor = .black
        mySegmentControl.backgroundColor = .tertiarySystemBackground
        mySegmentControl.addTarget(self, action: #selector(ViewController.segmentValueChangedSix(_:)), for: .valueChanged)
        mySegmentControl.translatesAutoresizingMaskIntoConstraints = false
        return mySegmentControl
    }()
    
    /// SETUP: TableViewCell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(mySegmentControl)
        contentView.clipsToBounds = true
        accessoryType = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        mySegmentControl.sizeToFit()
        mySegmentControl.frame = CGRect(x: (contentView.frame.size.width - mySegmentControl.frame.size.width)/2,
                                        y: (contentView.frame.size.height - mySegmentControl.frame.size.height)/2,
                                        width: mySegmentControl.frame.size.width,
                                        height: mySegmentControl.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mySegmentControl.isSelected = false
    }

    public func configure(with model: SettingsSix) {
        mySegmentControl.isSelected = model.isSelected
    }
} /// END OF CLASS
