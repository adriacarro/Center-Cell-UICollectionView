//
//  ViewController.swift
//  Detail
//
//  Created by Adrià Carro on 26/02/16.
//  Copyright © 2016 DigitalYou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var centerView: UIView!
    @IBOutlet var leftView: UIView!
    @IBOutlet var rightView: UIView!
    
    var page: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        let cellWidth = centerView.frame.size.width
        page = Int(ceil(self.collectionView.contentOffset.x / cellWidth))
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func didRotateFromInterfaceOrientation(fromInterfaceOrientation: UIInterfaceOrientation) {
        let cellWidth = centerView.frame.size.width
        self.collectionView.contentOffset = CGPoint(x: CGFloat(page)*cellWidth, y: 0)
    }

}

extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellWidth = centerView.frame.size.width
        return CGSize(width: cellWidth, height: self.view.bounds.height)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, leftView.frame.size.width, 0, leftView.frame.size.width)
    }
    
}

extension ViewController : UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: "\(indexPath.row+1)")!
        return cell
    }
    
}