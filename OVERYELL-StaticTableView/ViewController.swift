//
//  ViewController.swift
//  OVERYELL-StaticTableView
//
//  Created by Benjamin Skomrock on 05/2022
//  Copyright © 2022 Overyell.com. All rights reserved.
//

import UIKit

struct Section {
    let title: String
    let footer: String
    let options: [SettingsType]
}

enum SettingsType {
    case oneCell(model: SettingsOne)
    case twoCell(model: SettingsTwo)
    case threeCell(model: SettingsThree)
    case fourCell(model: SettingsFour)
    case fiveCell(model: SettingsFive)
    case sixCell(model: SettingsSix)
}

struct SettingsOne {
    let title: String
    let icon: UIImage?
    let iconColor: UIColor
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

struct SettingsTwo {
    let title: String
    let icon: UIImage?
    let iconColor: UIColor
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

struct SettingsThree {
    let title: String
    let icon: UIImage?
    let iconColor: UIColor
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

struct SettingsFour {
    let title: String
    let icon: UIImage?
    let iconColor: UIColor
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

struct SettingsFive {
    let title: String
    let icon: UIImage?
    let iconColor: UIColor
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isSelected: Bool
    var isOn: Bool
}

struct SettingsSix {
    let handler: (() -> Void)
    var isSelected: Bool
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var models = [Section]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    /// OVERRIDE DEVICE ORIENTATION
    override func viewDidLayoutSubviews() {
        Settings()
    }
    
    func Settings(){
        Configure()
        title = "Settings"
        view.addSubview(tableView)
        tableView.backgroundColor = .secondarySystemBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .insetGrouped)
        table.register(TableViewCellOne.self, forCellReuseIdentifier: TableViewCellOne.identifier)
        table.register(TableViewCellTwo.self, forCellReuseIdentifier: TableViewCellTwo.identifier)
        table.register(TableViewCellThree.self, forCellReuseIdentifier: TableViewCellThree.identifier)
        table.register(TableViewCellFour.self, forCellReuseIdentifier: TableViewCellFour.identifier)
        table.register(TableViewCellFive.self, forCellReuseIdentifier: TableViewCellFive.identifier)
        table.register(TableViewCellSix.self, forCellReuseIdentifier: TableViewCellSix.identifier)
        return table
    }()
    
    func Configure() {
        
        /// TableViewCellOne
        models.append(Section(title: "ONE", footer: "Note: Description", options: [
            .oneCell(model: SettingsOne(
                    title: "ONE\none\none\none",
                    icon: UIImage(systemName: "checkmark.seal"),
                    iconColor: .systemRed,
                    iconBackgroundColor: .clear,
                    handler: {
                        print("TableViewCellOne - 1 - pressed")
            })),
        ]))
        
        /// TableViewCellTwo
        models.append(Section(title: "TWO", footer: "Note: Description", options: [
            .twoCell(model: SettingsTwo(
                    title: "TWO - 1",
                    icon: UIImage(systemName: "checkmark.seal"),
                    iconColor: .black,
                    iconBackgroundColor: .systemBlue,
                    handler: {
                        print("TableViewCellTwo - 1 - pressed")
            }, isOn: false)),
            .twoCell(model: SettingsTwo(
                    title: "TWO - 2",
                    icon: UIImage(systemName: "checkmark.seal"),
                    iconColor: .black,
                    iconBackgroundColor: .systemGreen,
                    handler: {
                        print("TableViewCellTwo - 2 - pressed")
            }, isOn: false)),
        ]))
        
        /// TableViewCellThree
        models.append(Section(title: "THREE", footer: "Note: Description", options: [
            .threeCell(model: SettingsThree(
                    title: "THREE - 1",
                    icon: UIImage(systemName: "checkmark.seal"),
                    iconColor: .black,
                    iconBackgroundColor: .systemRed){
                        print("TableViewCellThree - 1 - pressed")
            }),
            .threeCell(model: SettingsThree(
                    title: "THREE - 2",
                    icon: UIImage(systemName: "checkmark.seal"),
                    iconColor: .black,
                    iconBackgroundColor: .systemYellow){
                        print("TableViewCellThree - 2 - pressed")
            }),
        ]))
        
        /// TableViewCellFour
        models.append(Section(title: "FOUR", footer: "Note: Description", options: [
            .fourCell(model: SettingsFour(
                    title: "FOUR - 1",
                    icon: UIImage(systemName: "checkmark.seal"),
                    iconColor: .white,
                    iconBackgroundColor: .black){
                        print("TableViewCellFour - 1 - pressed")
            }),
            .fourCell(model: SettingsFour(
                    title: "FOUR - 2",
                    icon: UIImage(systemName: "checkmark.seal"),
                    iconColor: .black,
                    
                    iconBackgroundColor: .gray){
                        print("TableViewCellFour - 2 - pressed")
            }),
        ]))
        
        /// TableViewCellFive
        models.append(Section(title: "FIVE", footer: "Note: Description", options: [
            .fiveCell(model: SettingsFive(
                    title: "FIVE - 1",
                    icon: UIImage(systemName: "checkmark.seal"),
                    iconColor: .white,
                    iconBackgroundColor: .clear,
                    handler: {
                        print("TableViewCellFive - 1 - pressed")
                    },
                    isSelected: false,
                    isOn: false
            ))
        ]))
        
        /// TableViewCellSix
        models.append(Section(title: "SIX", footer: "Note: Description", options: [
            .sixCell(model: SettingsSix(
                    handler: {
                        print("TableViewCellSix - 1 - pressed")
                    },
                    isSelected: false
            ))
        ]))
        
    } /// END OF CONFIGURE()
    
    /// Header for each section
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = models[section]
        return section.title
    }
    
    /// Footer for each footer
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let section = models[section]
        return section.footer
    }
    
    /// IF accessoryButton is available and Tapped
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        switch indexPath.section
        {
            case 0: return print("ACCESSORY ButtonTapped in row: '\(indexPath.row)'")
            case 1: return print("ACCESSORY ButtonTapped in row: '\(indexPath.row)'")
            case 2: return print("ACCESSORY ButtonTapped in row: '\(indexPath.row)'")
            case 3: return print("ACCESSORY ButtonTapped in row: '\(indexPath.row)'")
            case 4: return print("ACCESSORY ButtonTapped in row: '\(indexPath.row)'")
            default: return print("ACCESSORY ButtonTapped in row: '\(indexPath.row)'")
        }
    }
    
    /// Change the rowHeight for each Section
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section
        {
            case 0: return 120
            case 1: return 50
            case 2: return 50
            case 3: return 50
            case 4: return 50
            default: return 50
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    /// Build your TableViewCell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        
        switch model.self {
            case .oneCell(let model):
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: TableViewCellOne.identifier,
                    for: indexPath
                ) as? TableViewCellOne else {
                    return UITableViewCell()
                }
                cell.backgroundColor = .tertiarySystemBackground
                cell.configure(with: model)
                return cell
                
            case .twoCell(let model):
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: TableViewCellTwo.identifier,
                    for: indexPath
                ) as? TableViewCellTwo else {
                    return UITableViewCell()
                }
               
                cell.backgroundColor = .tertiarySystemBackground
                cell.configure(with: model)
                return cell
                
            case .threeCell(let model):
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: TableViewCellThree.identifier,
                    for: indexPath
                ) as? TableViewCellThree else {
                    return UITableViewCell()
                }
                cell.backgroundColor = .tertiarySystemBackground
                cell.configure(with: model)
                return cell
                
            case .fourCell(let model):
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: TableViewCellFour.identifier,
                    for: indexPath
                ) as? TableViewCellFour else {
                    return UITableViewCell()
                }
                cell.backgroundColor = .tertiarySystemBackground
                cell.configure(with: model)
                return cell
                
            case .fiveCell(let model):
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: TableViewCellFive.identifier,
                    for: indexPath
                ) as? TableViewCellFive else {
                    return UITableViewCell()
                }
                cell.backgroundColor = .tertiarySystemBackground
                cell.configure(with: model)
                return cell
                
            case .sixCell(let model):
                guard let cell = tableView.dequeueReusableCell(
                    withIdentifier: TableViewCellSix.identifier,
                    for: indexPath
                ) as? TableViewCellSix else {
                    return UITableViewCell()
                }
                cell.backgroundColor = .tertiarySystemBackground
                cell.configure(with: model)
                return cell
        }
    }
    
    @objc func segmentValueChangedFive(_ sender : UISegmentedControl!){
        switch sender.selectedSegmentIndex {
        case 0:
            print("CASE 0")
        case 1:
            print("CASE 1")
        default:
            print("DEFAULT")
        }
    }
    
    @objc func segmentValueChangedSix(_ sender : UISegmentedControl!){
        switch sender.selectedSegmentIndex {
        case 0:
            print("CASE 0")
        case 1:
            print("CASE 1")
        case 2:
            print("CASE 2")
        case 3:
            print("CASE 3")
        case 4:
            print("CASE 4")
        default:
            print("DEFAULT")
        }
    }
    
    /// IF switch.value for each row hase changed
    @objc func switchChanged(_ sender : UISwitch!){
          print("TableViewCellTwo Switch in row: '\(sender.tag)' used")
          print("The switch is \(sender.isOn ? "ON" : "OFF")")
    }
    
    /// IF TableViewCell is clicked.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type = models[indexPath.section].options[indexPath.row]
        switch type.self {
        case .oneCell(let model):
            model.handler()
        case .twoCell(let model):
            model.handler()
        case .threeCell(let model):
            model.handler()
        case .fourCell(let model):
            model.handler()
        case .fiveCell(let model):
            model.handler()
        case .sixCell(let model):
            model.handler()
        }
    }
} /// END OF CLASS


