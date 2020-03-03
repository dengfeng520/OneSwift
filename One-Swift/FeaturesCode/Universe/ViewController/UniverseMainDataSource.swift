//
//  UniverseMainDataSource.swift
//  One-Swift
//
//  Created by rp.wang on 2019/7/2.
//  Copyright © 2019 西安乐推网络科技有限公司. All rights reserved.
//

import UIKit

extension UniverseMainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.presenter.univerMainArray.count == 0 {
            return 4
        }
        return self.presenter.univerMainArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.presenter.univerMainArray.count == 0 {
            let cell: UniverseMainPlaceTableViewCell! = (tableView.dequeueReusableCell(withIdentifier: "UniverseMainPlaceTableViewCellID", for: indexPath) as! UniverseMainPlaceTableViewCell)
            return cell
        }
        let cell: UniverseMainTableViewCell! = (tableView.dequeueReusableCell(withIdentifier: "UniverseMainTableViewCellID", for: indexPath) as! UniverseMainTableViewCell)
        
        return cell
    }
}

extension UniverseMainViewController: UITableViewDelegate {
    
}
