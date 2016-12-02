//
//  APScreen3.swift
//  Untitled
//
//  Created by alexeyweb11@gmail.com on 02/12/2016, using AnimaApp.com, under MIT license.
//  Copyright © 2016 Company Name. All rights reserved.
//

import UIKit
import MapKit

public class APScreen3 : ANViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var table3: UITableView?
    @IBOutlet weak var map1: MKMapView?

    

    override public func awakeFromNib() -> Void {
        super.awakeFromNib();
    }

    @IBAction func map1Pinch(sender: Any?) {let identifier = "screen3"
        let storyboardInstance = self.storyboard!.instantiateViewController(withIdentifier: identifier)
        self.present(storyboardInstance, animated: true)
    }



    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == self.table3) {
            return 1; // Cell per type, acting like a static table
        }
        return 0;
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == self.table3) {
            switch (indexPath.row) {
                case 0:
                    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell3") as! APCell3;
                    cell.delegate = self;
                    return cell;
                default:
                    break;
            }
        }
        return UITableViewCell();
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (tableView == self.table3) {
            switch (indexPath.row) {
                case 0:
                    return 55.0;
                default:
                    return 0.0;
            }
        }
        return 0.0;
    }
}