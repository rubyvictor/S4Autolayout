//
//  PageCell.swift
//  S4AutoLayout
//
//  Created by Victor Lee on 23/2/18.
//  Copyright © 2018 VictorLee. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    // separate view from controller by setting the page model here:
    var page: Page? {
        didSet {
            
            guard let unwrappedPage = page else { return }
            imageView.image = UIImage(named: unwrappedPage.imageName)
            
//            descriptionView.text = unwrappedPage.headerText
            
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 24)])
            attributedText.append(NSMutableAttributedString(string: "\n\n\n\(unwrappedPage.bodyText)", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16),NSAttributedStringKey.foregroundColor:UIColor.gray]))
            
            descriptionView.attributedText = attributedText
            descriptionView.textAlignment = .center
            
        }
    }
    
    private let imageView: UIImageView = {
        let iv = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    private let descriptionView: UITextView = {
        let dv = UITextView()
        
        let attributedText = NSMutableAttributedString(string: "Another awesome way of adding text via autolayout", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 24)])
        attributedText.append(NSMutableAttributedString(string: "\n\n\nAren't we having loads ot awesome Swift 4 autolayout fun thanks to Brian sensei!!!", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16)]))

        dv.attributedText = attributedText
        dv.textAlignment = .center
        dv.textColor = .purple
        dv.isEditable = false
        dv.isScrollEnabled = false
        dv.translatesAutoresizingMaskIntoConstraints = false
        return dv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupAutolayout()
        
    }
    
    private func setupAutolayout(){
        
        let topImageContainerView = UIView()
        topImageContainerView.backgroundColor = .clear
        
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.addSubview(imageView)
        
        imageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.6).isActive = true
        
        addSubview(descriptionView)
        
        descriptionView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
