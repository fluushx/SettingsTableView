//
//  ViewController.swift
//  SettingsTableView
//
//  Created by Felipe Ignacio Zapata Riffo on 10-08-21.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case staticCell(model:SettingsOption)
    case switfhCell(model:SettingsSwitchOption)
}

struct SettingsSwitchOption {
    let title:String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler : (()->Void)
    var isOn: Bool
}
struct SettingsOption {
    let title:String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler : (()->Void)
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var models = [Section]()
    
    private let tableView:UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        table.register(SwitchTableViewCell.self, forCellReuseIdentifier: SwitchTableViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        title = "Settings"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    func configure(){
        
        models.append(Section(title: "General", options: [
            .switfhCell(model: SettingsSwitchOption(title: "Air Plane", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemBlue, handler: {
                
            }, isOn: true))
        ]))
        
        models.append(Section(title: "General", options: [
            .staticCell(model:   SettingsOption(title: "Wifi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemPink, handler: {
            })),
            .staticCell(model:   SettingsOption(title: "Bluetooh", icon: UIImage(systemName: "bluetooh"), iconBackgroundColor: .link, handler: {
            })),
            .staticCell(model:   SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen, handler: {
            })),
            .staticCell(model:   SettingsOption(title: "Icloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange, handler: {
            }))
        ]))
        
        models.append(Section(title: "Information", options: [
            .staticCell(model:   SettingsOption(title: "Wifi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemPink, handler: {
            })),
            .staticCell(model:   SettingsOption(title: "Bluetooh", icon: UIImage(systemName: "bluetooh"), iconBackgroundColor: .link, handler: {
            })),
            .staticCell(model:   SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen, handler: {
            })),
            .staticCell(model:   SettingsOption(title: "Icloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange, handler: {
            }))
        ]))
        
        models.append(Section(title: "Apps", options: [
            .staticCell(model:   SettingsOption(title: "Wifi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemPink, handler: {
            })),
            .staticCell(model:   SettingsOption(title: "Bluetooh", icon: UIImage(systemName: "bluetooh"), iconBackgroundColor: .link, handler: {
            })),
            .staticCell(model:   SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen, handler: {
            })),
            .staticCell(model:   SettingsOption(title: "Icloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange, handler: {
            }))
        ]))
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let model = models[section]
        return model.title
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].options.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].options[indexPath.row]
        switch model.self {
            case .staticCell(let model):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as? SettingTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(with: model)
                return cell
            case .switfhCell(let model):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.identifier, for: indexPath) as? SwitchTableViewCell else {
                    return UITableViewCell()
                }
                cell.configure(with: model)
                return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let type =  models[indexPath.section].options[indexPath.row]
        
        switch type.self {
            case .staticCell(let model):
                model.handler()
            case .switfhCell(let model):
                model.handler()
                
        }
    }
}

