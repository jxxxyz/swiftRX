//
//  ViewController.swift
//  swiftRX
//
//  Created by otc on 2018/9/20.
//  Copyright © 2018年 mixotc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = UITableView()
    
    public let sectionTitleArray = ["Traditional", "responsive"]
    public let sectionSubtitleArray = ["传统", "响应"]
    public let titleArray = [
        [
            "tableView traditional",
        ],
        [
            "tableView responsive",
            ],
        ]
    
    public let subtitleArray = [
        [
            "列表传统式编程",
        ],
        [
            "列表响应式编程",
            ],
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CELLKEY)
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension ViewController: UITableViewDataSource {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray[section].count
    }
    
    //返回对应的单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell") ?? UITableViewCell.init(style: .subtitle, reuseIdentifier: "UITableViewCell")
            
            cell.textLabel?.textColor = UIColor.init(white: 0.0, alpha: 0.6)
            cell.textLabel?.font = UIFont.init(name: "ChalkboardSE-Bold", size: 14.0)
            cell.textLabel?.lineBreakMode = .byCharWrapping
            cell.textLabel?.text = "\(indexPath.section + 1).\(indexPath.row + 1) \(titleArray[indexPath.section][indexPath.row])"
            cell.textLabel?.numberOfLines = 2
            
            cell.detailTextLabel?.textColor = UIColor.init(white: 0.0, alpha: 0.5)
            cell.detailTextLabel?.font = UIFont.init(name: "ChalkboardSE-Bold", size: 11.0)
            cell.detailTextLabel?.text = "\(indexPath.section + 1).\(indexPath.row + 1) \(subtitleArray[indexPath.section][indexPath.row])"
            cell.detailTextLabel?.numberOfLines = 2
            
            return cell
    }
}

extension ViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68.0
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 42.0
    }
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitleArray[section] + " " + "(" + sectionSubtitleArray[section] + ")"
    }
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                self.navigationController?.pushViewController(OrginTableViewController(), animated: true)
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                self.navigationController?.pushViewController(OrginTableViewController(), animated: true)
            default:
                break
            }
        default:
            break
        }
    }
}

