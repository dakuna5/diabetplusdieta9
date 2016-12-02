//
//  APUsercell1.swift
//  Untitled
//
//  Created by alexeyweb11@gmail.com on 02/12/2016, using AnimaApp.com, under MIT license.
//  Copyright © 2016 Company Name. All rights reserved.
//

import UIKit

public class APUsercell1 : UITableViewCell {
    
    weak open var delegate: ANCustomViewDelegate?
    @IBOutlet weak var label19: UILabel?
    @IBOutlet weak var view8: UIView?
    @IBOutlet weak var view8Image16: UIImageView?
    @IBOutlet weak var label20: UILabel?

    open var dataDictionary: NSDictionary? {
        didSet {
            self.label19!.text = self.dataDictionary!.an_object(forJsonPath: "Full Name") as! String?
            self.view8Image16!.anImageNameOrUrl = self.dataDictionary!.an_object(forJsonPath: "Image") as! String?
            self.label20!.text = self.dataDictionary!.an_object(forJsonPath: "Username") as! String?
        }
    }

    override public func awakeFromNib() -> Void {
        super.awakeFromNib();
        self.setupGestures();
    }

    internal func setupGestures() -> Void {
        var gestureRecognizer: UIGestureRecognizer;
        gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.userstablesmallUsercellSwipeRight(sender:)))
        (gestureRecognizer as! UISwipeGestureRecognizer).direction = UISwipeGestureRecognizerDirection.right
        self.contentView.isUserInteractionEnabled = true;
        self.contentView.addGestureRecognizer(gestureRecognizer); 
    }
    

    @IBAction func userstablesmallUsercellSwipeRight(sender: Any?) {
    self.delegate?.view(self, shouldPushViewControllerWithIdentifier: "screen1", animated: true)
    }

}