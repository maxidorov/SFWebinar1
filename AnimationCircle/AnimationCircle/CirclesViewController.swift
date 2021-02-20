//
//  ViewController.swift
//  AnimationCircle
//
//  Created by Maxim V. Sidorov on 2/20/21.
//

import UIKit

class CirclesViewController: UIViewController {

    private let circlesCount = 7
    private var circles = [Circle]()

    override func viewDidLoad() {
        super.viewDidLoad()

        generateCircles()
    }

    private func generateCircles() {
        for i in 0...circlesCount - 1 {
            let center = CGPoint(x: 30 + i * 30, y: 80 + 170 * (i % 4))
            let radius = CGFloat(30 + i * 4)
            let circle = Circle(center: center, radius: radius)
            circle.delegate = self
            view.addSubview(circle)
            circles.append(circle)
        }
    }
}

extension CirclesViewController: CircleDelegate {
    func moved(_ circle: Circle) {
        intersectingCircles(with: circle).forEach { another in
            circle.eat(another)
        }
    }

    private func intersectingCircles(with circle: Circle) -> [Circle] {
        var answer = [Circle]()
        for another in circles.filter { $0 !== circle } {
            if circle.frame.intersects(another.frame) {
                answer.append(another)
            }
        }
        return answer
    }
}

