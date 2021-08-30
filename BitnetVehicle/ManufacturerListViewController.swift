//
//  ReminderListViewController.swift
//  Today
//
//  Created by Borbély Viktor on 2021. 08. 28..
//

import UIKit

class ManufacturerListViewController: UITableViewController {}

extension ManufacturerListViewController {
    static let manufacturerListCellIdentifier = "ManufacturerListCell"
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Manufacturer.testData.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.manufacturerListCellIdentifier, for: indexPath) as? ManufacturerListCell else {
            fatalError("Unable to dequeue ManufacturerCell")
        }
        
        let mfr = Manufacturer.testData[indexPath.row]
        cell.nameLabel.text = mfr.name
        cell.typesLabel.text =  mfr.vehicleTypes.joined(separator: ",")
        
        return cell
    }
    
}


