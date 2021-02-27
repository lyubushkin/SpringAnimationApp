//
//  Animation.swift
//  SpringAnimationApp
//
//  Created by Swift on 26.02.2021.
//

struct Animation {
    let preset: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
    var description: String {
            "preset: \(preset)\n" +
            "curve: \(curve)\n" +
            "\(String(format: "force: %.2f", force))\n" +
            "\(String(format: "duration: %.2f", duration))\n" +
            "\(String(format: "delay: %.2f", delay))"
    }
}

extension Animation {
    static func getAnimation(with preset: String) -> Animation {
        Animation(preset: preset,
                  curve: DataManager.shared.animationCurve.randomElement() ?? "",
                  force: Double.random(in: 1...2),
                  duration: Double.random(in: 1...3),
                  delay: Double.random(in: 0...1))
    }
    
    static func getPreset() -> String {
        DataManager.shared.animationPreset.randomElement() ?? ""
    }
}
