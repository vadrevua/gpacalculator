//
//  ViewController.swift
//  GPACalc
//
//  Created by Aditya on 2/9/17.
//  Copyright © 2017 Aditya. All rights reserved.
//

import UIKit

class classID {
    var courseTitleID : String? = nil
    let answerLabel1 : UILabel
    let answerLabel2 : UILabel
    let answerLabel3 : UILabel
    let answerLabel4 : UILabel
    let labelCounter: Int = 1
    init(course1Label: UILabel, course2Label: UILabel, course3Label: UILabel, course4Label: UILabel, couseName: UITextField) {
        self.courseTitleID = couseName.text
        self.answerLabel1 = course1Label
        self.answerLabel2 = course2Label
        self.answerLabel3 = course3Label
        self.answerLabel4 = course4Label
    }
    
    func addCourseLabel() -> Bool{
        if(answerLabel1.isHidden){
           answerLabel1.text = courseTitleID!
           answerLabel1.isHidden = false
            return true
        }
        else if(answerLabel2.isHidden){
            answerLabel2.text = courseTitleID!
            answerLabel2.isHidden = false
            return true
        }
        else if(answerLabel3.isHidden){
            answerLabel3.text = courseTitleID!
            answerLabel3.isHidden = false
            return true
        }
        else if(answerLabel4.isHidden){
            answerLabel4.text = courseTitleID!
            answerLabel4.isHidden = false
            return true
        }
        else{
        return false
        }
     }

    }


class courseInfo{
    var assignmentPointNum : Double
    var assignmentMaxNum: Double
    var assignmentPercentNum: Double
    var midtermPointNum: Double
    var midtermMaxNum: Double
    var midtermPercentNum: Double
    var finalPointNum : Double
    var finalMaxNum: Double
    var finalPercentNum: Double
    
    
    init(assignmentPoint: UITextField, assignmentMax: UITextField, assignmentPercent: UITextField, midtermPoint: UITextField, midtermMax: UITextField, midtermPercent: UITextField, finalPoint: UITextField, finalMax: UITextField, finalPercent: UITextField) {
        self.assignmentPointNum = Double(assignmentPoint.text!)!
        self.assignmentMaxNum = Double(assignmentMax.text!)!
        self.assignmentPercentNum = Double(assignmentPercent.text!)!
        self.midtermPointNum = Double(midtermPoint.text!)!
        self.midtermMaxNum = Double(midtermMax.text!)!
        self.midtermPercentNum = Double(midtermPercent.text!)!
        self.finalPointNum = Double(finalPoint.text!)!
        self.finalMaxNum = Double(finalMax.text!)!
        self.finalPercentNum = Double(finalPercent.text!)!
        
        
    }
   
    func solve() -> Double{
        let assignmentVals = (assignmentPointNum/assignmentMaxNum)*(assignmentPercentNum/100)
        let midtermVals = (midtermPointNum/midtermMaxNum)*(midtermPercentNum/100)
        let finalVals = (finalPointNum/finalMaxNum)*(finalPercentNum/100)
        let courseGrade = assignmentVals + midtermVals + finalVals
        return courseGrade
    }

}


class ViewController: UIViewController {
    
    @IBOutlet weak var courseTitle: UITextField!
    @IBOutlet weak var assignmentPoint: UITextField!
    @IBOutlet weak var assignmentMax: UITextField!
    @IBOutlet weak var assignmentPercent: UITextField!
    @IBOutlet weak var midtermPoint: UITextField!
    @IBOutlet weak var midtermMax: UITextField!
    @IBOutlet weak var midtermPercent: UITextField!
    @IBOutlet weak var finalPoint: UITextField!
    @IBOutlet weak var finalMax: UITextField!
    @IBOutlet weak var finalPercent: UITextField!
    @IBOutlet weak var addClassButton: UIButton!
    @IBOutlet weak var creditsNum: UITextField!
    @IBOutlet weak var deleteClassButton: UIButton!
    @IBOutlet weak var deleteClassNum: UITextField!
    @IBOutlet weak var gpaLabel: UILabel!
    @IBOutlet weak var courseLabel1: UILabel!
    @IBOutlet weak var courseLabel2: UILabel!
    @IBOutlet weak var courseLabel3: UILabel!
    @IBOutlet weak var courseLabel4: UILabel!
    
    @IBOutlet weak var course1A: UIImageView!
    @IBOutlet weak var course1B: UIImageView!
    @IBOutlet weak var course1C: UIImageView!
    @IBOutlet weak var course1D: UIImageView!
    @IBOutlet weak var course1F: UIImageView!
    
    @IBOutlet weak var course2A: UIImageView!
    @IBOutlet weak var course2B: UIImageView!
    @IBOutlet weak var course2D: UIImageView!
    @IBOutlet weak var course2F: UIImageView!
    @IBOutlet weak var course2C: UIImageView!
    
    @IBOutlet weak var course3A: UIImageView!
    @IBOutlet weak var course3B: UIImageView!
    @IBOutlet weak var course3C: UIImageView!
    @IBOutlet weak var course3D: UIImageView!
    @IBOutlet weak var course3F: UIImageView!
    
    @IBOutlet weak var course4A: UIImageView!
    @IBOutlet weak var course4B: UIImageView!
    @IBOutlet weak var course4C: UIImageView!
    @IBOutlet weak var course4D: UIImageView!
    @IBOutlet weak var course4F: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    
@IBAction func addCourse(_ sender: UIButton){
    let assignmentPointInt = Int(assignmentPoint.text!)
    let assignmentMaxInt = Int(assignmentMax.text!)
    let midtermPointInt = Int(midtermPoint.text!)
    let midtermMaxInt = Int(midtermMax.text!)
    let finalPointInt = Int(finalPoint.text!)
    let finalMaxInt = Int(finalMax.text!)
    let assignmentPercentInt = Int(assignmentPercent.text!)
    let midtermPercentInt = Int(midtermPercent.text!)
    let finalPercentInt = Int(finalPercent.text!)
    

    
    if(assignmentPercentInt! + midtermPercentInt! + finalPercentInt! == 100){
    if(assignmentPointInt! <= assignmentMaxInt! && midtermPointInt! <= midtermMaxInt! && finalPointInt! <= finalMaxInt!){
        
        if(assignmentPointInt! >= 0 || assignmentMaxInt! >= 0 || midtermPointInt! >= 0 || midtermMaxInt! >= 0 || finalPointInt! >= 0 || finalMaxInt! >= 0 || assignmentPercentInt! >= 0 || midtermPercentInt! >= 0 || finalPercentInt! >= 0){
            
    let classLabels = classID(course1Label: courseLabel1, course2Label: courseLabel2, course3Label: courseLabel3, course4Label: courseLabel4, couseName: courseTitle)
        
    let boolVal = classLabels.addCourseLabel()
            
    if(boolVal == false){
        let alert = UIAlertController(title: "Error", message: "Cannot add more than 4 Courses",preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        }
        deleteClassButton.isHidden = false
        deleteClassNum.isHidden = false
        
}
        else{
            let alert = UIAlertController(title: "Error", message: "Cannot have negative numbers",preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
        }
    }
        
    else{
        let alert = UIAlertController(title: "Error", message: "Point number cannot be above max number",preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
}
      
        

    }
    else{
    let alert = UIAlertController(title: "Error", message: "Percents have to equal 100",preferredStyle: .alert)
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    alert.addAction(cancelAction)
    present(alert, animated: true, completion: nil)
    }
    }

    
    
    
    @IBAction func deleteLabel(_ sender: UIButton){
        let deletingClassNumber = Int(deleteClassNum.text!)
        if(deletingClassNumber == 1 && courseLabel1.isHidden == false){
        courseLabel1.isHidden = true
        }
            
        else if(deletingClassNumber == 2 && courseLabel2.isHidden == false){
            courseLabel2.isHidden = true
        }
        
        else if(deletingClassNumber == 3 && courseLabel3.isHidden == false){
                courseLabel3.isHidden = true
        }
            
        else if(deletingClassNumber == 4 && courseLabel4.isHidden == false){
                courseLabel4.isHidden = true
        }
            
        else {
            let alert = UIAlertController(title: "Error", message: "Cannot delete an Item that does not exist",preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

