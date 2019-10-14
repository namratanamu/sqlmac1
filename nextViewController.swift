//
//  nextViewController.swift
//  mactest1
//
//  Created by Felix 05 on 25/09/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit


var allTaskNames = [String]()
var allTaskIds = [String]()
class nextViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTaskNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.detailTextLabel?.text = allTaskIds[indexPath.row]
        cell.textLabel?.text = allTaskNames[indexPath.row]
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let selectQuery = "select F_Name, F_Rate,F_Type from newFoodTable"
        databaselib.shareObj.selectall(query: selectQuery)
        allTaskNames = databaselib.shareObj.F_Name
        allTaskIds = databaselib.shareObj.F_Rate
        tableview.reloadData()
        print(allTaskNames)
        print(allTaskIds)

        // Do any additional setup after loading the view.
    }

    
    @IBOutlet weak var tableview: UITableView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
