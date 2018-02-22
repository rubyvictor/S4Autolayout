//
//  ViewController.swift
//  S4AutoLayout
//
//  Created by Victor Lee on 1/10/17.
//  Copyright © 2017 VictorLee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let imageView: UIImageView = {
       let iv = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    let descriptionView: UITextView = {
       let dv = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Another awesome way of adding text via autolayout", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 24)])
        attributedText.append(NSMutableAttributedString(string: "\n\n\nAren't we having loads ot awesome Swift 4 autolayout fun thanks to Brian sensei!!!", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16)]))
        dv.attributedText = attributedText
        
//        dv.text = "Another awesome way of adding text via autolayout"
//        dv.font = UIFont.boldSystemFont(ofSize: 18)
        dv.textAlignment = .center
        dv.textColor = .purple
        dv.isEditable = false
        dv.isScrollEnabled = false
        dv.translatesAutoresizingMaskIntoConstraints = false
        return dv
    }()
    
    //apply correct encapsulation principles. i.e. making private classes so that outside classes cannot interact with what's inside
    private let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Prev", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(descriptionView)
        setupAutolayout()
        setupAutoControls()
       
    }
    
    fileprivate func setupAutoControls(){
        view.addSubview(previousButton)
        previousButton.backgroundColor = .red
        
        // Use this as alternative to setting isActive = true for each constraint
        // use safeAreaLayoutGuide's topAnchor for iphone X to avoid top bar area
        // Next, place previous Button at the bottom of screen
        NSLayoutConstraint.activate([
            previousButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            previousButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            previousButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            previousButton.heightAnchor.constraint(equalToConstant: 50)
            
            ])
        
        
        
    }

    private func setupAutolayout(){
        
        let topImageContainerView = UIView()
        topImageContainerView.backgroundColor = .clear
        view.addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.addSubview(imageView)
        
    imageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
    imageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
    imageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6).isActive = true
    
        

        descriptionView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }

}

