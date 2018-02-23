//
//  SwipingController.swift
//  S4AutoLayout
//
//  Created by Victor Lee on 23/2/18.
//  Copyright © 2018 VictorLee. All rights reserved.
//

import UIKit




class SwipingController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var cellId = "cellId"
    
    let pages = [Page(imageName: "bear_first", headerText: "Another awesome way of adding text via autolayout", bodyText: "Aren't we having loads ot awesome Swift 4 autolayout fun thanks to Brian sensei!!!"),
                 Page(imageName: "heart_second", headerText: "Hey Join us here!", bodyText: "Awesome man - thanks to Brian sensei!!!"),
                 Page(imageName: "leaf_third", headerText: "Awesome! You won't regret signing up", bodyText: "Unbelievable value of coding - thanks brian")
                 ]
    
    
//    let imageNames = ["bear_first","heart_second","leaf_third"]
//    let headerStrings = ["Another awesome way of adding text via autolayout","Hey Join us here!","Awesome! You won't regret signing up"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView?.isPagingEnabled = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    // set size of each cell to the whole view frame
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    // set vertical spacing to enable snap effect when swiping
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell

        let page = pages[indexPath.item]
        cell.page = page
        
//        cell.imageView.image = UIImage(named: page.imageName)
//        cell.descriptionView.text = page.headerText
//
//        let imageName = imageNames[indexPath.item]
//        cell.imageView.image = UIImage(named: imageName)
//        let headerString = headerStrings[indexPath.item]
//        cell.descriptionView.text = headerString
        
        // To see more clearly, set first cell in indexPath to different color from the second cell
//        cell.backgroundColor = indexPath.item % 2 == 0 ? .red : .green
        return cell
    }
    
}
