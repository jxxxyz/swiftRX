//
//  RxMusicTableViewController.swift
//  swiftRX
//
//  Created by otc on 2018/9/20.
//  Copyright © 2018年 mixotc. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxMusicTableViewController: UIViewController {

    lazy var tableView: UITableView = UITableView()
    //歌曲列表数据源
    let musicVM = RxMusicVM()
    //负责对象销毁
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: CELLKEY)
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.top.right.bottom.equalToSuperview()
        }
        
        //将数据源数据绑定到tableView上
        musicVM.data
            .bind(to: tableView.rx.items(cellIdentifier:CELLKEY)) { _, music, cell in
                cell.textLabel?.text = music.name
                cell.detailTextLabel?.text = music.singer
            }.disposed(by: disposeBag)
        
        //tableView点击响应
        tableView.rx.modelSelected(Music.self).subscribe(onNext: { music in
            print("你选中的歌曲信息【\(music)】")
        }).disposed(by: disposeBag)
    }
}
