//
//  Music.swift
//  swiftRX
//
//  Created by otc on 2018/9/20.
//  Copyright © 2018年 mixotc. All rights reserved.
//

import UIKit

struct Music {
    let name: String
    let singer: String
    
    init(name: String, singer: String) {
        self.name = name
        self.singer = singer
    }
}

extension Music: CustomStringConvertible {
    var description: String {
        return "name：\(name) singer：\(singer)"
    }
}
