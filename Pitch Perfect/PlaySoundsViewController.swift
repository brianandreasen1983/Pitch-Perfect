//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Brian Andreasen on 4/15/20.
//  Copyright © 2020 Brian Andreasen. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var slowButton: UIButton!
    @IBOutlet weak var fastButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var highPitchButton: UIButton!
    @IBOutlet weak var lowPitchButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudioURL:URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!

    enum ButtonType: Int {
        case slow = 0, fast, echo, reverb, highPitch, lowPitch
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch (ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        case .highPitch:
            playSound(pitch: 1000)
        case .lowPitch:
            playSound(pitch: -1000)
            break
        default:
            break
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopSound() {
        stopAudio()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }
}
