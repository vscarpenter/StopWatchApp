//
//  ViewController.swift
//  StopWatchApp
//
//  Created by Vinny Carpenter on 12/22/14.
//  Copyright (c) 2014 Vinny Carpenter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var timeLabel: UILabel!
    var timer: NSTimer?
    var startTime: NSDate?
    var currentTime: NSDate?
    var stopTime: NSDate?
    var dateFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "HH:mm:ss.SS"
        dateFormatter.timeZone = NSTimeZone(name: "UTC")
        
        timeLabel.text = dateStringFromTimeInterval(0)
    }
    
    
    func startTimer() {
       
        if timer == nil {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateTimer:"), userInfo: nil, repeats: true)
            
            if (stopTime != nil) {
                var duration = stopTime?.timeIntervalSinceDate(startTime!)
                startTime = NSDate(timeInterval: -duration!, sinceDate: NSDate())
                
            } else {
                startTime = NSDate()
            }
        } else {
            
        }
    }
    
    func updateTimer(runningTimer: NSTimer) {
        currentTime = NSDate()
        if startTime != nil {
            var duration = currentTime?.timeIntervalSinceDate(startTime!)
            timeLabel.text = dateStringFromTimeInterval(duration!)
        }
    }
    
    func  dateStringFromTimeInterval(timeInvterval: NSTimeInterval) -> String {
        var date = NSDate(timeIntervalSince1970: timeInvterval)
        return dateFormatter.stringFromDate(date)
    }
    
    func stopTimer() {
        stopTime = NSDate()
        timer?.invalidate()
        timer = nil
        
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
        
        startTime = nil
        stopTime = nil
        currentTime = nil
        
        timeLabel.text = dateStringFromTimeInterval(0)
    }
    
    @IBAction func startButtonPressed(sender: AnyObject) {
        startTimer()
    }
    
    @IBAction func stopButtonPressed(sender: AnyObject) {
        stopTimer()
    }
    
    @IBAction func resetButtonPressed(sender: AnyObject) {
        resetTimer()
    }
}

