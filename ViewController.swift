//
//  ViewController.swift
//  mactest1
//
//  Created by Felix 05 on 25/09/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    
   // @IBOutlet weak var Insert: UIButton!
    
    @IBOutlet weak var textname: UITextField!
    
    @IBOutlet weak var textprize: UITextField!
    
    
    @IBOutlet weak var typetext: UITextField!
    
    
    
    @IBAction func next(_ sender: UIButton) {
        
        
        
        let next = storyboard?.instantiateViewController(withIdentifier: "nextViewController") as! nextViewController
        navigationController?.pushViewController(next, animated: true)
    }
    
    @IBAction func inserttable(_ sender: Any) {
        let insertQuery = "insert into newFoodTable(F_Name, F_Rate,F_Type) values ('\(textname.text!)','\(textprize.text!)','Snacks')"
        let issuccess = databaselib.shareObj.executeQuery(query:insertQuery )
        if issuccess
        {
            print("insert success")
        }
        else
        {
            print("insert failed")
        }
    }
        
    
    
   
        
    
        
        
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

