//
//  BusTimeTable.swift
//  BusSeconds
//
//  Created by Hiroaki-Hirabayashi on 2022/01/03.
//

import Foundation

struct BusTimeTable {
    // date: [Int: [Int]]
    let busTimeTable = [
        06:[07,15,25,28,36,42,50,58],
        07:[08,16,25,35,42,50,59],
        08:[06,15,22,29,39,45,55],
        09:[07,16,27,38,50],
        10:[00,10,24,35,50],
        11:[05,20,35,50],
        12:[05,20,35,50],
        00:[10]
    ]
}
