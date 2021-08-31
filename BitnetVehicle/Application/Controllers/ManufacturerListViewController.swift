//
//  ReminderListViewController.swift
//  Today
//
//  Created by Borbély Viktor on 2021. 08. 28..
//

import UIKit

class ManufacturerListViewController: UITableViewController {
    // TODO DI megvalósítani
    let apiService = ApiService()
    var mfrs = [Manufacturer]()

    @IBOutlet var mfrsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        apiService.getManufacturers { data, error in
            if let error = error {
                print(error.message)
                self.view.showToast(toastMessage: "Error: \(error.code != nil ? error.code!.description : "") \(error.message)", duration: CGFloat(Constants.Timings.Transitions.toastDurationLong))
            }
            
            if let data = data {
                self.mfrs = data.results.map({ resultDto in
                    Manufacturer(name: resultDto.commonName ?? resultDto.name, vehicleTypes: resultDto.vehicleTypes.map({ vehicleTypeDto in vehicleTypeDto.name
                    }))
                })
            }
            
            self.tableView.reloadData()
        
        }
        
    }
    
}

extension ManufacturerListViewController {
    static let manufacturerListCellIdentifier = "ManufacturerListCell"
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return mfrs.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.manufacturerListCellIdentifier, for: indexPath) as? ManufacturerListCell else {
            fatalError("Unable to dequeue ManufacturerCell")
        }
        
        //let mfr = Manufacturer.testData[indexPath.row]
        let mfr = mfrs[indexPath.row]
        cell.nameLabel.text = mfr.name
        cell.typesLabel.text =  mfr.vehicleTypes.joined(separator: ",")
        
        return cell
    }
    
}


