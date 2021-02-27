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
    
    @IBOutlet var parametrsLabel: UILabel!
    @IBOutlet var startLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        parametrsLabel?.isHidden = true
    }

    @IBAction func runSpringAnimation(_ sender: SpringButton) {
        
        startLabel.isHidden = true
        parametrsLabel?.isHidden = false
        
        let animation = Animation.getAnimation(with: nextPreset)
        
        springAnimationView.animation = animation.preset
        springAnimationView.curve = animation.curve
        springAnimationView.force = CGFloat(animation.force)
        springAnimationView.duration = CGFloat(animation.duration)
        springAnimationView.delay = CGFloat(animation.delay)
        springAnimationView.animate()
        
        parametrsLabel.text = animation.description
               
        nextPreset = Animation.getPreset()
        runButton.setTitle("Run \(nextPreset)", for: .normal)
    }
}


