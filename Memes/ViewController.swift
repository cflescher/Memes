// ViewController.swift 
// Memes
// Created on 4/26/21 by Conrad Flescher.
// Copyright 2021 Conrad Flescher. All rights reserved.

import UIKit


class ViewController: UIViewController {

    //MARK: outlets
    //These connect UI elements in the storyboard to variables
    //that can be manipulated in code.
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
    ///Takes in an array of choices, and a control to add those choices to.
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

    
    //not sure what `override` does, but the system calls this
    //when the storyboard is done loading.
    override func viewDidLoad() {
        super.viewDidLoad()
        topSegmentedControl.removeAllSegments()
        bottomSegmentedControl.removeAllSegments()
        
        addControlOptions(options: topCaptionOptions, control: topSegmentedControl)
        addControlOptions(options: bottomCaptionOptions, control: bottomSegmentedControl)
        
    }

    
    //MARK: actions
    //these are basically event listeners, called by the storyboard.
    //the `sender` argument is the outlet corresponding to the
    //storyboard object that sent the event
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
    
    @IBAction func topCaptionControlTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                topCaptionLabel.text = updateLabel(type: .one, position: .top)
            case 1:
                topCaptionLabel.text = updateLabel(type: .two, position: .top)
            case 2:
                topCaptionLabel.text = updateLabel(type: .three, position: .top)
            default:
                topCaptionLabel.text = "you shouldn't be seeing this"
                //swift requires that "Switch [statements] must be exhaustive"
        }
    }
    
    @IBAction func bottomCaptionControlTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                bottomCaptionLabel.text = updateLabel(type: .one, position: .bottom)
            case 1:
                bottomCaptionLabel.text = updateLabel(type: .two, position: .bottom)
            case 2:
                bottomCaptionLabel.text = updateLabel(type: .three, position: .bottom)
            default:
                bottomCaptionLabel.text = "you shouldn't be seeing this"
                //swift requires that "Switch [statements] must be exhaustive"
        }
    }
}

