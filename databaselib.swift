//
//  databaselib.swift
//  mactest1
//
//  Created by Felix 05 on 25/09/19.
//  Copyright © 2019 felix. All rights reserved.
//

import Foundation
import SQLite3
class databaselib
{
    static let shareObj = databaselib()
    var F_Name = [String]()
    var F_Rate = [String]()
    var F_Type = [String]()
    func databasePath() -> String
    {
        let dir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = dir.first!
        return path+"myDatabase.sqlite"
    }
    func executeQuery(query:String) ->Bool
    {
        var success: Bool = false
        var db:OpaquePointer? = nil
        var stmt:OpaquePointer? = nil
        let dbPath = databasePath()
        
        if sqlite3_open(dbPath, &db) == SQLITE_OK
        {
            if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK
            {
                if sqlite3_step(stmt) == SQLITE_DONE
                {
                    success = true
                }
                    
                else
                {
                    print("error in step:\(sqlite3_errmsg(stmt))")
                }
            }
            else
            {
                print("error in prepare:\(sqlite3_errmsg(stmt))")
            }
        }
        else
        {
            print("error in Open:\(sqlite3_errmsg(stmt))")
        }
        return success
    }
    func selectall(query:String)
    {
        
        var db:OpaquePointer? = nil
        var stmt:OpaquePointer? = nil
        let dbPath = databasePath()
        
        if sqlite3_open(dbPath, &db) == SQLITE_OK
        {
            if sqlite3_prepare_v2(db, query, -1, &stmt, nil) == SQLITE_OK
            {
               F_Name.removeAll()
                F_Rate.removeAll()
                while sqlite3_step(stmt) == SQLITE_ROW
                {
                    let fname = sqlite3_column_text(stmt, 0)
                    let foodname = String(cString: fname!)
                    F_Name.append(foodname)
                    let fid = sqlite3_column_text(stmt, 1)
                    let foodrate = String(cString:fid!)
                    F_Rate.append(foodrate)
                    let ftype = sqlite3_column_text(stmt, 2)
                    let foodtype = String(cString:ftype!)
                    F_Type.append(foodtype)
                    
                    
                }
                print(F_Type)
                print(F_Rate)
                print(F_Name)
            }
                
            else
            {
                print("error in prepare:\(sqlite3_errmsg(stmt))")
            }
        }
        else
        {
            print("error in Open:\(sqlite3_errmsg(stmt))")
        }
        
    }
    func createTable()
    {
        let createQuery = "create table if not exists newFoodTable(F_Name text, F_Rate text,F_Type text)"
        let isSuccess = executeQuery(query: createQuery)
        if isSuccess
            
        {
            print("table creation:success")
            
        }
        else{
            print("table creation:failed")
        }
    }
}
