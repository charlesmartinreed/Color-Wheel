//
//  ViewController.swift
//  Color Wheel
//
//  Created by Charles Martin Reed on 2/24/19.
//  Copyright © 2019 Charles Martin Reed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var containerView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: redSliderColor, green: greenSliderColor, blue: blueSliderColor, alpha: 1)
        view.layer.cornerRadius = containerViewHeight / 2
        
        return view
        
    }()
    
    lazy var redSlider: UISlider = {
       let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.value = 0.0
        slider.maximumValue = 1.0
        
        slider.addTarget(self, action: #selector(redSliderValueChanged), for: .valueChanged)
        return slider
    }()
    
    lazy var greenSlider: UISlider = {
       let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.value = 0.0
        slider.maximumValue = 1.0
        
        slider.addTarget(self, action: #selector(greenSliderValueChanged), for: .valueChanged)
        return slider
    }()
    
    lazy var blueSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.value = 0.0
        slider.maximumValue = 1.0
        
        slider.addTarget(self, action: #selector(blueSliderValueChanged), for: .valueChanged)
        return slider
    }()
    
    var redSliderColor: CGFloat = 0 {
        didSet {
            containerView.backgroundColor = UIColor(red: redSliderColor , green: greenSliderColor, blue: blueSliderColor, alpha: 1)
        }
    }
    
    var greenSliderColor: CGFloat = 0 {
        didSet {
            containerView.backgroundColor = UIColor(red: redSliderColor , green: greenSliderColor, blue: blueSliderColor, alpha: 1)
        }
    }
    
    var blueSliderColor: CGFloat = 0 {
        didSet {
            containerView.backgroundColor = UIColor(red: redSliderColor , green: greenSliderColor, blue: blueSliderColor, alpha: 1)
        }
    }
    
    let containerViewWidth: CGFloat = 200
    let containerViewHeight: CGFloat = 200
    let colorSquareDimensions: CGFloat = 3
    
    let numViewPerRow = 56
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(containerView)
        view.addSubview(blueSlider)
        view.addSubview(greenSlider)
        view.addSubview(redSlider)
        
        let containerViewConstraints: [NSLayoutConstraint] = [
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.heightAnchor.constraint(equalToConstant: containerViewHeight),
            containerView.widthAnchor.constraint(equalToConstant: containerViewWidth)
        ]
        
        let blueSliderConstraints: [NSLayoutConstraint] = [
            blueSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            blueSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            blueSlider.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ]
        
        let greenSliderConstraints: [NSLayoutConstraint] = [
            greenSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            greenSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            greenSlider.bottomAnchor.constraint(equalTo: blueSlider.topAnchor, constant: -8)
        ]
        
        let redSliderConstraints: [NSLayoutConstraint] = [
            redSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            redSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            redSlider.bottomAnchor.constraint(equalTo: greenSlider.topAnchor, constant: -8)
        ]
        
        let constraints = [containerViewConstraints, blueSliderConstraints, greenSliderConstraints, redSliderConstraints]
        constraints.forEach { (constraint) in
            NSLayoutConstraint.activate(constraint)
        }
        
    }
    
    @objc func redSliderValueChanged() {
        redSliderColor = CGFloat(redSlider.value)
    }
    
    @objc func greenSliderValueChanged() {
        greenSliderColor = CGFloat(greenSlider.value)
    }
    
    @objc func blueSliderValueChanged() {
        blueSliderColor = CGFloat(blueSlider.value)
    }
    
    private func colorForSquare() -> UIColor {
        //drand returns a random number between 0 and 1
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }


}

