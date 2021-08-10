//
//  ViewController.swift
//  SettingsTableView
//
//  Created by Felipe Ignacio Zapata Riffo on 10-08-21.
//

import UIKit

struct Section {
    let title: String
    let options: [SettingsOption]
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
            SettingsOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink, handler: {
            }),
            SettingsOption(title: "Bluetooh", icon: UIImage(systemName: "bluetooh"), iconBackgroundColor: .link, handler: {
            }),
            SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen, handler: {
            }),
            SettingsOption(title: "Icloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange, handler: {
            })
        ]))
        
        models.append(Section(title: "Information", options: [
            SettingsOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink, handler: {
            }),
            SettingsOption(title: "Bluetooh", icon: UIImage(systemName: "bluetooh"), iconBackgroundColor: .link, handler: {
            }),
            SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen, handler: {
            }),
            SettingsOption(title: "Icloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange, handler: {
            })
        ]))
        
        models.append(Section(title: "Apps", options: [
            SettingsOption(title: "Wifi", icon: UIImage(systemName: "house"), iconBackgroundColor: .systemPink, handler: {
            }),
            SettingsOption(title: "Bluetooh", icon: UIImage(systemName: "bluetooh"), iconBackgroundColor: .link, handler: {
            }),
            SettingsOption(title: "Airplane Mode", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemGreen, handler: {
            }),
            SettingsOption(title: "Icloud", icon: UIImage(systemName: "cloud"), iconBackgroundColor: .systemOrange, handler: {
            })
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
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        let model = models[indexPath.section].options[indexPath.row]
        cell.configure(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model =  models[indexPath.section].options[indexPath.row]
        model.handler()
    }
}

