//
//  OrginTableViewController.swift
//  swiftRX
//
//  Created by otc on 2018/9/20.
//  Copyright © 2018年 mixotc. All rights reserved.
//

import UIKit
import Then
import SnapKit
let CELLKEY = "musicCell"

class OrginTableViewController: UIViewController {

    lazy var tableView: UITableView = UITableView()
    //歌曲列表数据源
    let musicVM = MusicVM()
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension OrginTableViewController: UITableViewDataSource {
    //返回单元格数量
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicVM.data.count
    }
    
    //返回对应的单元格
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: CELLKEY)!
            let music = musicVM.data[indexPath.row]
            cell.textLabel?.text = music.name
            cell.detailTextLabel?.text = music.singer
            return cell
    }
}

extension OrginTableViewController: UITableViewDelegate {
    //单元格点击
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("你选中的歌曲信息【\(musicVM.data[indexPath.row])】")
    }
}
