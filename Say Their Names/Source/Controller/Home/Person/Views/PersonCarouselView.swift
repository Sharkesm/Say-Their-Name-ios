//
//  PersonPhotoCarousel.swift
//  Say Their Names
//
//  Created by Manase on 04/06/2020.
//  Copyright © 2020 Franck-Stephane Ndame Mpouli. All rights reserved.
//

import UIKit

final class PersonPhotoCarousel: UIView {
 
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: superview!.bounds)
        view.backgroundColor = .red
        return view 
    }()
    
    lazy var personCarouselView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.scrollView.bounds.width, height: 530))
        view.backgroundColor = .black
        view.clipsToBounds = true
        return view
    }()
    
    lazy var visualEffectView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: effect)
        view.frame = self.personCarouselView.bounds
        return view
    }()
    
    lazy var personImageContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.clipsToBounds = true
        return view
    }()
    
    lazy var bgPersonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = self.personCarouselView.bounds
        imageView.image = UIImage(named: "man-in-red-jacket-1681010")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = self.personImageContainer.bounds
        imageView.image = UIImage(named: "man-in-red-jacket-1681010")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var navigationControlView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let shareButton: UIButton = {
        let button = UIButton(type: .custom)
        let buttonImage = UIImage(named: "share_white")
        button.setImage(buttonImage, for: .normal)
        return button
    }()
    
    let dismissButton: UIButton = {
        let button = UIButton(type: .custom)
        let buttonImage = UIImage(named: "Close Icon")
        button.setImage(buttonImage, for: .normal)
        return button
    }()

    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        createLayout()
    }
    
    
    private func createLayout() {
        let scroll = UIScrollView(frame: superview!.bounds)
        scroll.backgroundColor = .red
        
        personImageView.translatesAutoresizingMaskIntoConstraints = false
        personImageContainer.translatesAutoresizingMaskIntoConstraints = false
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        
        let actionStackView = UIStackView(arrangedSubviews: [dismissButton, shareButton])
        actionStackView.axis = .horizontal
        actionStackView.alignment = .fill
        actionStackView.distribution = .equalSpacing
        actionStackView.translatesAutoresizingMaskIntoConstraints = false
        
        personImageContainer.addSubview(personImageView)
        visualEffectView.contentView.addSubview(actionStackView)
        
        visualEffectView.contentView.addSubview(personImageContainer)
        personCarouselView.addSubview(bgPersonImageView)
        personCarouselView.addSubview(visualEffectView)
        
        scroll.addSubview(personCarouselView)
        addSubview(scroll)
        
        NSLayoutConstraint.activate([
            actionStackView.leadingAnchor.constraint(equalTo: visualEffectView.leadingAnchor, constant: 25),
            actionStackView.topAnchor.constraint(equalTo: visualEffectView.topAnchor, constant: 20),
            actionStackView.trailingAnchor.constraint(equalTo: visualEffectView.trailingAnchor, constant: -25),
            actionStackView.heightAnchor.constraint(equalToConstant: 50),
            
            personImageContainer.leadingAnchor.constraint(equalTo: visualEffectView.leadingAnchor, constant: 40),
            personImageContainer.trailingAnchor.constraint(equalTo: visualEffectView.trailingAnchor, constant: -40),
            personImageContainer.topAnchor.constraint(equalTo: actionStackView.bottomAnchor, constant: 20),
            personImageContainer.heightAnchor.constraint(equalToConstant: 380),
            
            personImageView.leadingAnchor.constraint(equalTo: personImageContainer.leadingAnchor, constant: 0),
            personImageView.trailingAnchor.constraint(equalTo: personImageContainer.trailingAnchor, constant: 0),
            personImageView.topAnchor.constraint(equalTo: personImageContainer.topAnchor, constant: 0),
            personImageView.bottomAnchor.constraint(equalTo: personImageContainer.bottomAnchor, constant: 0)
        ])
    }
}
