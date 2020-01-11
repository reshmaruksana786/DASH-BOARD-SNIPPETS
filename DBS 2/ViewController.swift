//
//  ViewController.swift
//  DBS 2
//
//  Created by Syed.Reshma Ruksana on 9/11/19.
//  Copyright © 2019 Syed.Reshma Ruksana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var URLReqObj:URLRequest!
    var dataTaskObj:URLSessionDataTask!
    
    
    var dashBoardData:[[String:Any]]!
    
    var holiadayDetails = [[String:String]]()
    
    var leaveDetails=[[String:String]]()
    
    var lateDetails=[[String:String]]()
    
    var missedDetails=[[String:String]]()

    
// FOR HOLIDAY

    
    @IBAction func getHolidayButton(_ sender: Any) {
    
        dashBoardData = dashBoard()
        
        var ypos = 70
        
        for x in dashBoardData
        
        {
            for (key,value) in x
              
            {
              
                if(key == "dayType")
                  
                {
                  
                    if(x["dayType"] as! String == "Holiday")
                     
                    {
                       
                        var tempDict = [String:String]()
                        
                        tempDict["date"] = x["attendanceDate"] as! String
                        
                        tempDict["holidayType"] = x["reasonForNonAttendance"] as! String
                        
                        
                        holiadayDetails.append(tempDict)
                        
                        let gap = 25
                        
                        var xposForDay = 100
                        
                        var xposForHolidayType = 20
                        
                        
                        self.view.backgroundColor=UIColor.green
                        
                        
                        let dateLabelForHoliday = UILabel()
                        
                        dateLabelForHoliday.frame = CGRect(x: xposForHolidayType, y: ypos, width: 100, height: 30)
                        
                        dateLabelForHoliday.backgroundColor = .red
                        
                        view.addSubview(dateLabelForHoliday)
                        
                        dateLabelForHoliday.text = tempDict["date"]
                        
                        
                        
                        let reasonLabelForHoliday = UILabel()
                        
                        reasonLabelForHoliday.frame = CGRect(x: xposForDay, y: ypos, width: 100, height: 30)
                        
                        reasonLabelForHoliday.backgroundColor = UIColor.orange
                        
                        view.addSubview(reasonLabelForHoliday)
                        
                        ypos += gap
                        
                        reasonLabelForHoliday.text = tempDict["holidayType"]

                    }
                   
                }
               
            }
            
        }
        
        print(holiadayDetails)
        
    }
    
// FOR LEAVE

    
    @IBAction func getLeavesButton(_ sender: Any) {
       
        dashBoardData = dashBoard()
    
        var ypos = 70
        
        for x in dashBoardData
            
        {
            
            for (key,value) in x
                
            {
                
                if(key == "isAttended" && x["dayType"] as! String == "Working")
                    
                {
                    
                    if(type(of:value) != NSNull.self)
                        
                    {
                        if(value as! Bool == false)
                        {
                            
                            
                            var tempDict = [String:String]()
                            
                            tempDict["date"] = x["attendanceDate"] as! String
                            
                            tempDict["leaveType"] = x["reasonForNonAttendance"] as! String
                            
                            
                            leaveDetails.append(tempDict)
                            
                            
                            let gap = 25
                            
                            var xposForDate = 210
                            
                            var xposForLeaveType = 310
                            
                            
                            self.view.backgroundColor=UIColor.green
                            
                            
                            
                            let dateLabelForLeave = UILabel()
                            
                            dateLabelForLeave.frame = CGRect(x: xposForDate, y: ypos, width: 100, height: 30)
                            
                            dateLabelForLeave.backgroundColor = .red
                            
                            view.addSubview(dateLabelForLeave)
                            
                            dateLabelForLeave.text = tempDict["date"]
                            
                            
                            let reasonLabelForLeave = UILabel()
                            
                            reasonLabelForLeave.frame = CGRect(x: xposForLeaveType, y: ypos, width: 100, height: 30)
                            
                            reasonLabelForLeave.backgroundColor = UIColor.orange
                            
                            view.addSubview(reasonLabelForLeave)
                            
                            ypos += gap
                            
                            reasonLabelForLeave.text = tempDict["leaveType"]
                            
                            
                        }
                        
                    }
                    
                }
                
            }
        }
        print(leaveDetails)
        
    }
    
 // FOR LATE

    @IBAction func getLateButton(_ sender: Any) {
   
        dashBoardData = dashBoard()
        
        
        var ypos = 400
        
        for x in dashBoardData
            
        {
            
            for (key,value) in x
                
            {
                
                if(key == "isLateCheckIn")
                    
                {
                    
                    if(type(of:value) != NSNull.self)
                        
                    {
                        if(value as! Int == 1)
                        {
                            
                            
                            var tempDict = [String:String]()
                            
                            tempDict["date"] = x["attendanceDate"] as! String
                            
                            tempDict["time"] = x["checkIn"] as! String
                            
                            
                            lateDetails.append(tempDict)
                            
                            let gap = 25
                            
                            var xposForDate = 20
                            
                            var xposForLate = 120
                            
                            
                            self.view.backgroundColor=UIColor.green
                            
                            
                            
                            let dateLabelForLate = UILabel()
                            
                            dateLabelForLate.frame = CGRect(x: xposForDate, y: ypos, width: 100, height: 30)
                            
                            dateLabelForLate.backgroundColor = .red
                            
                            view.addSubview(dateLabelForLate)
                            
                            dateLabelForLate.text = tempDict["date"]
                            
                            
                            
                            let checkInLabelForLate = UILabel()
                            
                            checkInLabelForLate.frame = CGRect(x: xposForLate, y: ypos, width: 100, height: 25)
                            
                            checkInLabelForLate.backgroundColor = UIColor.orange
                            
                            view.addSubview(checkInLabelForLate)
                            
                            ypos += gap
                            
                            checkInLabelForLate.text = tempDict["time"]
                            
                            
                        }
                        
                    }
                    
                }
                
            }
        }
        print(lateDetails)
        
    }
    
 //MINIMUM
    
    
    @IBAction func getMinimumHoursMissed(_ sender: Any) {
    
   
        dashBoardData = dashBoard()
        
        var ypos = 400
    
    
        for x in dashBoardData
            
        {
            
            for (key,value) in x
                
            {
                
                if(key == "isMinimumHrsMissed" && x["dayType"] as! String == "Working")

                {
                    
                    if(type(of:value) != NSNull.self)

                    {
                        if(value as! Bool == true)
                        {
                            
                            
                            var tempDict = [String:String]()
                            
                            tempDict["date"] = x["attendanceDate"] as! String
                            
                            tempDict["timeSpent"] = x["timeSpent"] as! String
                            
                            missedDetails.append(tempDict)
                        
                            
                            let gap = 25
                            
                            var xposForDate = 210
                            
                            var xposForLate = 310
                            
                            
                            self.view.backgroundColor=UIColor.green
                            
                            
                            
                            let dateLabelForMissed = UILabel()
                            
                            dateLabelForMissed.frame = CGRect(x: xposForDate, y: ypos, width: 100, height: 30)
                            
                            dateLabelForMissed.backgroundColor = .red
                            
                            view.addSubview(dateLabelForMissed)
                            
                            dateLabelForMissed.text = tempDict["date"]
                            
                            
                            
                            let timeLabelForMissed = UILabel()
                            
                            timeLabelForMissed.frame = CGRect(x: xposForLate, y: ypos, width: 100, height: 30)
                            
                            timeLabelForMissed.backgroundColor = UIColor.orange
                            
                            view.addSubview(timeLabelForMissed)
                            
                            ypos += gap
                            
                            timeLabelForMissed.text = tempDict["timeSpent"]
                            
                            
                        }
                        
                    }
                    
                }
                
            }
        }
        print(missedDetails)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        validatePulseLogin()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    //PULSE DETAILS
    
    func dashBoard() -> [[String:Any]]
    
    {
      
        var convertData:[[String:Any]]!
        
        URLReqObj = URLRequest(url: URL(string: "https://www.brninfotech.com/pulse/modules/admin/DashboardSnippets.php")!)
        
        URLReqObj.httpMethod = "POST" // storing the url in post
        
        //sending data request
        
        var dataToSend = "funcName=getUserAttendance&studentIDByAdmin=NoValue"
        
        //url request
        
        URLReqObj.httpBody = dataToSend.data(using: String.Encoding.utf8)
        
        // for getting data from server
        
        dataTaskObj = URLSession.shared.dataTask(with: URLReqObj, completionHandler: {(data,conn, err)in
         
            print("got data from server")
           
            // block using to handling for error
            
            do{
              
                convertData = try
                  
                    JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [[String:Any]]
                
                // converting code from jsonserialization to swift
                
                print(convertData)
                
        }catch

            {
              
                print("something wrong with you")
             
            }
           
        })
        
        dataTaskObj.resume()// it will display the above code
        
        while convertData == nil {
        
        }
       
        return convertData
    }
    
    func validatePulseLogin()
      
    {
     
        URLReqObj = URLRequest(url: URL(string: "https://www.brninfotech.com/pulse/modules/admin/ValidateLogin.php")!)
        
        URLReqObj.httpMethod = "POST" // storing the url in post
        
        //sending data request
        
        var dataToSend = "registeredEmail=reshmasmile468@gmail.com&registeredPassword=ruksi468&funcName=verifyLogin"
        
//url request
        
        URLReqObj.httpBody = dataToSend.data(using: String.Encoding.utf8)
        
// for getting data from server
        
        dataTaskObj = URLSession.shared.dataTask(with: URLReqObj, completionHandler: {(data,conn, err)in
           
            print("got data from server")
            
// block using to handling for error
           
            do{
               
                var convertData = try
                 
                    JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:String]
                
                // converting code from jsonserialization to swift
             
            }catch
               
            {
              print("something wrong with you")
            
            }
            
        })
        
        dataTaskObj.resume()     // it will display the above code
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

