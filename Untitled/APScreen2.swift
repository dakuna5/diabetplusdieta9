//
//  APScreen2.swift
//  Untitled
//
//  Created by alexeyweb11@gmail.com on 02/12/2016, using AnimaApp.com, under MIT license.
//  Copyright © 2016 Company Name. All rights reserved.
//

import UIKit

public class APScreen2 : ANViewController, UITableViewDataSource, UITableViewDelegate, ANDataListDelegate  {
    
    @IBOutlet weak var userstablesmall: UITableView?
    open var userstablesmallDataList: ANDataList?;

    

    override public func awakeFromNib() -> Void {
        super.awakeFromNib();
        self.userstablesmallDataList = ANDataList(type: ANDataTypeCSV, filenameOrUrl: "mock_users.csv", delegate: self);
        self.userstablesmallDataList!.refresh();
    }



    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableView == self.userstablesmall) {
            return Int(self.userstablesmallDataList!.count());
        }
        return 0;
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (tableView == self.userstablesmall) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "usercell") as! APUsercell1;
            cell.dataDictionary = self.userstablesmallDataList!.item(at: UInt(indexPath.row)) as NSDictionary?;
            cell.delegate = self;
            return cell;
        }
        return UITableViewCell();
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (tableView == self.userstablesmall) {
            return 70.0;
        }
        return 0.0;
    }

    public func dataListDidFinishLoading(_ dataList: ANDataList) {
        if (dataList == self.userstablesmallDataList) {
            guard let userstablesmall = userstablesmall else {
                return
            }
            userstablesmall.reloadData();
        }
    }
}