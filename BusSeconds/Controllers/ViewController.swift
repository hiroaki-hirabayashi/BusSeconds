//
//  ViewController.swift
//  BusSeconds
//
//  Created by Hiroaki-Hirabayashi on 2022/01/03.
//

import UIKit

final class ViewController: UIViewController {
    private let busTimeTable = BusTimeTable()
    private var busTimes: [BusTime] = []
    private var timer: Timer!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDate()
        setupTimer()
    }
    
    /// バスの時刻表を配列に入れる
    private func setupDate() {
        for (hour, minutes) in busTimeTable.busTimeTable {
            minutes.forEach { (minutes) in
                let busTime = BusTime(hour: hour, minutes: minutes)
                busTimes.append(busTime)
            }
        }
        print(busTimes)
    }
    
    /// タイマーで1秒毎に更新させる
    private func setupTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc private func update(t: Timer) {
        if let closestTime = closestTime(),
           let closestDate = closestTime.toDate() {
//            print(dateFormatter.string(from: closestDate))
            // 差分取得
            let interval = closestDate.timeIntervalSinceNow
            let intInterval = Int(interval)
            let hour = intInterval / (60 * 60)
            let minute = Int((intInterval - hour * 60 * 60) / 60)
            let second = intInterval % 60
            // 分、秒を整形する
            let minuteString = String(format: "%02d", minute)
            let secondString = String(format: "%02d", second)
            let text = "あと\(hour):\(minuteString):\(secondString)"
            timeLabel.text = text
            print("あと\(hour):\(minuteString):\(secondString)")
        }
    }
    
    /// 時刻表の直近の時間を取得
    private func closestTime() -> BusTime? {
        // 6時間
        var timeInterval: Double = 60 * 60 * 6
        var busTime: BusTime?
        
        busTimes.forEach { (b) in
            if b.intervalSinceNow() > 0 && b.intervalSinceNow() < timeInterval {
                timeInterval = b.intervalSinceNow()
                busTime = b
            }
        }
        return busTime
        
    }


}

