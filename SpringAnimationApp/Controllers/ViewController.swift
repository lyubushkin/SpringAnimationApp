//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by Swift on 26.02.2021.
//

import Spring

class ViewController: UIViewController {
    
    var nextPreset = Animation.getPreset()

    @IBOutlet var springAnimationView: SpringView!
    @IBOutlet var runButton: SpringButton!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    @IBOutlet var parametrsStackView: UIStackView!
    @IBOutlet var startLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parametrsStackView?.isHidden = true
    }

    @IBAction func runSpringAnimation(_ sender: SpringButton) {
        
        startLabel.isHidden = true
        parametrsStackView?.isHidden = false
        
        let animation = Animation.getAnimation(with: nextPreset)
        
        springAnimationView.animation = animation.preset
        springAnimationView.curve = animation.curve
        springAnimationView.force = CGFloat(animation.force)
        springAnimationView.duration = CGFloat(animation.duration)
        springAnimationView.delay = CGFloat(animation.delay)
        springAnimationView.animate()
        
        presetLabel.text = "preset: \(animation.preset)"
        curveLabel.text = "curve: \(animation.curve)"
        forceLabel.text = String(format: "force: %.2f", animation.force)
        durationLabel.text = String(format: "duration: %.2f", animation.duration)
        delayLabel.text = String(format: "delay: %.2f", animation.delay)
        
        nextPreset = Animation.getPreset()
        runButton.setTitle("Run \(nextPreset)", for: .normal)
    }
}


