//
//  GradientView.swift
//  Runtips-iOS
//
//  Created by Ricardo Isidro on 31/07/20.
//  Copyright © 2020 Ricardo Isidro Ramirez. All rights reserved.
//

import Foundation
import UIKit

class GradientableView: UIView {

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

}

@IBDesignable class GradientView: UIView {

    @IBInspectable var leftColor: UIColor = UIColor.white {
        didSet {
            updateGradientColors()
        }
    }

    @IBInspectable var rightColor: UIColor = UIColor.white {
        didSet {
            updateGradientColors()
        }
    }

    @IBInspectable var startPoint: CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            updateGradientDirection()
        }
    }

    @IBInspectable var endPoint: CGPoint = CGPoint(x: 1, y: 1) {
        didSet {
            updateGradientDirection()
        }
    }

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addGradient()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addGradient()
    }

    private func addGradient() {
        guard let layer = layer as? CAGradientLayer else { return }
        layer.masksToBounds = true
        updateGradientColors()
        updateGradientDirection()
    }

    private func updateGradientColors() {
        guard let layer = layer as? CAGradientLayer else { return }
        layer.colors = [leftColor.cgColor, rightColor.cgColor]
    }

    private func updateGradientDirection() {
        guard let layer = layer as? CAGradientLayer else { return }
        layer.startPoint = startPoint
        layer.endPoint = endPoint
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateGradientColors()
        updateGradientDirection()
    }

}
