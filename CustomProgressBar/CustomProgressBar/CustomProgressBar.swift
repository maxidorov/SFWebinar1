//
//  CustomProgressBar.swift
//  CustomProgressBar
//
//  Created by Maxim V. Sidorov on 1/25/21.
//

import Foundation
import UIKit

@IBDesignable
class CustomProgressBar: UIView {

    @IBInspectable
    var totalComponents: UInt = 4

    @IBInspectable
    var filledComponents: UInt = 2

    @IBInspectable
    var cornerRadius: CGFloat = 4

    @IBInspectable
    var filledColor: UIColor = .white

    @IBInspectable
    var unfilledColor: UIColor = .white

    @IBInspectable
    var spacing: CGFloat = 20.0

    private var components = [UIView]()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        render()
    }

    func render() {
        subviews.forEach { $0.removeFromSuperview() }

        let viewWidth: CGFloat = (frame.size.width - (spacing * (CGFloat(totalComponents) - 1))) / CGFloat(totalComponents)
        let viewHeight: CGFloat = frame.size.height

        var dx: CGFloat = 0
        for i in 0..<totalComponents {
            let component = UIView(frame: CGRect(x: dx, y: 0, width: viewWidth, height: viewHeight))
            dx += spacing + viewWidth
            addSubview(component)
            component.backgroundColor = i < filledComponents ? filledColor : unfilledColor
            component.layer.cornerRadius = cornerRadius
        }
    }
}
