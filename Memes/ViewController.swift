// ViewController.swift 
// Memes
// Created on 4/26/21 by Conrad Flescher.
// Copyright 2021 Conrad Flescher. All rights reserved.

import UIKit


class ViewController: UIViewController {

    //MARK: outlets
    @IBOutlet weak var topSegmentedControl: UISegmentedControl!
    @IBOutlet weak var bottomSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var topCaptionLabel: UILabel!
    @IBOutlet weak var bottomCaptionLabel: UILabel!
    
    //MARK: initial declarations
    let topCaptionOptions = [
        CaptionOption(type: .one, position: .top),
        CaptionOption(type: .two, position: .top),
        CaptionOption(type: .three, position: .top)
    ]
    
    let bottomCaptionOptions = [
        CaptionOption(type: .one, position: .bottom),
        CaptionOption(type: .two, position: .bottom),
        CaptionOption(type: .three, position: .bottom)
    ]
    
    
    //MARK: functions
    fileprivate func addControlOptions(options: [CaptionOption], control: UISegmentedControl) {
        for i in 0 ... (options.count - 1) {
            control.insertSegment(
                withTitle: options[i].emote, at: i, animated: false
            )
        }
    }
    
    
    func updateLabel(type: CaptionOption.CaptionType, position: CaptionPosition) -> String {
        return CaptionOption(type: type, position: position).caption
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        topSegmentedControl.removeAllSegments()
        bottomSegmentedControl.removeAllSegments()
        
        addControlOptions(options: topCaptionOptions, control: topSegmentedControl)
        addControlOptions(options: bottomCaptionOptions, control: bottomSegmentedControl)
        
        topSegmentedControl.selectedSegmentIndex = 0
        bottomSegmentedControl.selectedSegmentIndex = 0
    }

    
    //MARK: actions
    
    @IBAction func dragTopLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            topCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func dragBottomLabel(_ sender: UIPanGestureRecognizer) {
        if sender.state == .changed {
            bottomCaptionLabel.center = sender.location(in: view)
        }
    }
    
    @IBAction func topCaptionControlTapped(_ sender: Any) {
        
    }
    
}

