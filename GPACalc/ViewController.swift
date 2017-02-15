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
        return courseGrade*100
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
        let creditsNumInt = Double(creditsNum.text!)
        var gpaLabel1ForCalc: Double = 0.0
        var course1GPALabel: Double
        var gpaLabel2ForCalc: Double = 0.0
        var course2GPALabel: Double
        var gpaLabel3ForCalc: Double = 0.0
        var course3GPALabel: Double
        var gpaLabel4ForCalc: Double = 0.0
        var course4GPALabel: Double = 0.0
        var course1credits: Double = 0.0
        var course2credits: Double = 0.0
        var course3credits: Double = 0.0
        var course4credits: Double = 0.0
        var totalCreditsNum: Double = 0.0
        var actualGPANum: Double = 0.0
        
        
        if(courseLabel1.text != courseTitle.text && courseLabel2.text != courseTitle.text && courseLabel3.text != courseTitle.text && courseLabel4.text != courseTitle.text){
            if(assignmentPercentInt! + midtermPercentInt! + finalPercentInt! == 100){
                if(assignmentPointInt! <= assignmentMaxInt! && midtermPointInt! <= midtermMaxInt! && finalPointInt! <= finalMaxInt!){
                    
                    if(assignmentPointInt! >= 0 || assignmentMaxInt! >= 0 || midtermPointInt! >= 0 || midtermMaxInt! >= 0 || finalPointInt! >= 0 || finalMaxInt! >= 0 || assignmentPercentInt! >= 0 || midtermPercentInt! >= 0 || finalPercentInt! >= 0){
                        
                        let scoreKeeper = courseInfo(assignmentPoint: assignmentPoint, assignmentMax: assignmentMax, assignmentPercent: assignmentPercent, midtermPoint: midtermPoint, midtermMax: midtermMax, midtermPercent: midtermPercent, finalPoint: finalPoint, finalMax: finalMax, finalPercent: finalPercent)
                        let numberKeeper = scoreKeeper.solve()
                        // grade label cooresponding to course number assigned
                        if(courseLabel1.isHidden){
                            if(numberKeeper < 60){
                                course1F.isHidden = false
                            }
                            else if(numberKeeper < 69.9 && numberKeeper >= 60){
                                course1D.isHidden = false
                            }
                            else if(numberKeeper < 79.9 && numberKeeper >= 70){
                                course1C.isHidden = false
                            }
                            else if(numberKeeper < 89.9 && numberKeeper >= 80){
                                course1B.isHidden = false
                            }
                            else if(numberKeeper >= 90){
                                course1A.isHidden = false
                            }
                        }
                        else if(courseLabel2.isHidden){
                            if(numberKeeper < 60){
                                course2F.isHidden = false
                            }
                            else if(numberKeeper < 69.9 && numberKeeper >= 60){
                                course2D.isHidden = false
                            }
                            else if(numberKeeper < 79.9 && numberKeeper >= 70){
                                course2C.isHidden = false
                            }
                            else if(numberKeeper < 89.9 && numberKeeper >= 80){
                                course2B.isHidden = false
                            }
                            else if(numberKeeper >= 90){
                                course2A.isHidden = false
                            }
                        }
                        else if(courseLabel3.isHidden){
                            if(numberKeeper < 60){
                                course3F.isHidden = false
                            }
                            else if(numberKeeper < 69.9 && numberKeeper >= 60){
                                course3D.isHidden = false
                            }
                            else if(numberKeeper < 79.9 && numberKeeper >= 70){
                                course3C.isHidden = false
                            }
                            else if(numberKeeper < 89.9 && numberKeeper >= 80){
                                course3B.isHidden = false
                            }
                            else if(numberKeeper >= 90){
                                course3A.isHidden = false
                            }
                        }
                        else if(courseLabel4.isHidden){
                            if(numberKeeper < 60){
                                course4F.isHidden = false
                            }
                            else if(numberKeeper < 69.9 && numberKeeper >= 60){
                                course4D.isHidden = false
                            }
                            else if(numberKeeper < 79.9 && numberKeeper >= 70){
                                course4C.isHidden = false
                            }
                            else if(numberKeeper < 89.9 && numberKeeper >= 80){
                                course4B.isHidden = false
                            }
                            else if(numberKeeper >= 90){
                                course4A.isHidden = false
                            }
                            
                        }
                        else{
                            let alert = UIAlertController(title: "Error", message: "AN ERROR HAS OCCURED",preferredStyle: .alert)
                            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                            alert.addAction(cancelAction)
                            present(alert, animated: true, completion: nil)
                        }
                        //end Grade Label Assigning
                        let classLabels = classID(course1Label: courseLabel1, course2Label: courseLabel2, course3Label: courseLabel3, course4Label: courseLabel4, couseName: courseTitle)
                        let boolVal = classLabels.addCourseLabel()
                        deleteClassButton.isHidden = false
                        deleteClassNum.isHidden = false
                        
                        
                        // GPA Label Begin
                        if(courseLabel1.isHidden == false){
                            if(course1A.isHidden == false){
                                course1GPALabel = 4.0
                            }
                            else if(course1B.isHidden == false){
                                course1GPALabel = 3.0
                            }
                            else if(course1A.isHidden == false){
                                course1GPALabel = 2.0
                            }
                            else if(course1A.isHidden == false){
                                course1GPALabel = 1.0
                            }
                            else {
                                course1GPALabel = 0.0
                            }
                            course1credits = creditsNumInt!
                            gpaLabel1ForCalc = course1GPALabel * creditsNumInt!
                        }
                        else if(courseLabel2.isHidden == false){
                            if(course2A.isHidden == false){
                                course2GPALabel = 4.0
                            }
                            else if(course2B.isHidden == false){
                                course2GPALabel = 3.0
                            }
                            else if(course2A.isHidden == false){
                                course2GPALabel = 2.0
                            }
                            else if(course2A.isHidden == false){
                                course2GPALabel = 1.0
                            }
                            else {
                                course2GPALabel = 0.0
                            }
                            course2credits = creditsNumInt!
                            gpaLabel2ForCalc = course2GPALabel * creditsNumInt!
                        }
                        else if(courseLabel3.isHidden == false){
                            if(course3A.isHidden == false){
                                course3GPALabel = 4.0
                            }
                            else if(course3B.isHidden == false){
                                course3GPALabel = 3.0
                            }
                            else if(course3A.isHidden == false){
                                course3GPALabel = 2.0
                            }
                            else if(course3A.isHidden == false){
                                course3GPALabel = 1.0
                            }
                            else {
                                course3GPALabel = 0.0
                            }
                            course3credits = creditsNumInt!
                            gpaLabel3ForCalc = course3GPALabel * creditsNumInt!
                        }
                        else if(courseLabel4.isHidden == false){
                            if(course4A.isHidden == false){
                                course4GPALabel = 4.0
                            }
                            else if(course4B.isHidden == false){
                                course4GPALabel = 3.0
                            }
                            else if(course4A.isHidden == false){
                                course4GPALabel = 2.0
                            }
                            else if(course4A.isHidden == false){
                                course4GPALabel = 1.0
                            }
                            else {
                                course4GPALabel = 0.0
                            }
                            course4credits = creditsNumInt!
                            gpaLabel4ForCalc = course4GPALabel * creditsNumInt!
                        }
                        else{
                            let alert = UIAlertController(title: "Error", message: "MASSIVE ERROR HAS OCCURED",preferredStyle: .alert)
                            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                            alert.addAction(cancelAction)
                            present(alert, animated: true, completion: nil)
                        }
                        totalCreditsNum = course1credits + course2credits + course3credits + course4credits
                        
                        if(courseLabel1.isHidden == false && courseLabel2.isHidden && courseLabel3.isHidden && courseLabel4.isHidden){
                            actualGPANum = gpaLabel1ForCalc/totalCreditsNum
                            gpaLabel.text = "GPA: \(actualGPANum)"
                            if(actualGPANum < 2.0){
                                gpaLabel.textColor = UIColor.red
                            }
                            else if(actualGPANum >= 2.0 && actualGPANum < 3){
                                gpaLabel.textColor = UIColor.orange
                            }
                            else{
                                gpaLabel.textColor = UIColor.green
                            }
                        }
                            
                        else if(courseLabel1.isHidden == false && courseLabel2.isHidden == false && courseLabel3.isHidden && courseLabel4.isHidden){
                            actualGPANum = (gpaLabel1ForCalc + gpaLabel2ForCalc)/totalCreditsNum
                            gpaLabel.text = "GPA: \(actualGPANum)"
                            if(actualGPANum < 2.0){
                                gpaLabel.textColor = UIColor.red
                            }
                            else if(actualGPANum >= 2.0 && actualGPANum < 3){
                                gpaLabel.textColor = UIColor.orange
                            }
                            else{
                                gpaLabel.textColor = UIColor.green
                            }
                        }
                            
                        else if(courseLabel1.isHidden == false && courseLabel2.isHidden == false && courseLabel3.isHidden == false && courseLabel4.isHidden){
                            actualGPANum = (gpaLabel1ForCalc + gpaLabel2ForCalc + gpaLabel3ForCalc)/totalCreditsNum
                            gpaLabel.text = "GPA: \(actualGPANum)"
                            if(actualGPANum < 2.0){
                                gpaLabel.textColor = UIColor.red
                            }
                            else if(actualGPANum >= 2.0 && actualGPANum < 3){
                                gpaLabel.textColor = UIColor.orange
                            }
                            else{
                                gpaLabel.textColor = UIColor.green
                            }
                        }
                            
                        else if(courseLabel1.isHidden == false && courseLabel2.isHidden == false && courseLabel3.isHidden == false && courseLabel4.isHidden == false){
                            actualGPANum = (gpaLabel1ForCalc + gpaLabel2ForCalc + gpaLabel3ForCalc + gpaLabel4ForCalc)/totalCreditsNum
                            gpaLabel.text = "GPA: \(actualGPANum)"
                            if(actualGPANum < 2.0){
                                gpaLabel.textColor = UIColor.red
                            }
                            else if(actualGPANum >= 2.0 && actualGPANum < 3){
                                gpaLabel.textColor = UIColor.orange
                            }
                            else{
                                gpaLabel.textColor = UIColor.green
                            }
                        }
                            
                        else if(courseLabel1.isHidden && courseLabel2.isHidden == false && courseLabel3.isHidden && courseLabel4.isHidden){
                            actualGPANum = gpaLabel2ForCalc/totalCreditsNum
                            gpaLabel.text = "GPA: \(actualGPANum)"
                            if(actualGPANum < 2.0){
                                gpaLabel.textColor = UIColor.red
                            }
                            else if(actualGPANum >= 2.0 && actualGPANum < 3){
                                gpaLabel.textColor = UIColor.orange
                            }
                            else{
                                gpaLabel.textColor = UIColor.green
                            }
                        }
                        else if(courseLabel1.isHidden && courseLabel2.isHidden == false && courseLabel3.isHidden == false && courseLabel4.isHidden){
                            actualGPANum = (gpaLabel2ForCalc + gpaLabel3ForCalc)/totalCreditsNum
                            gpaLabel.text = "GPA: \(actualGPANum)"
                            if(actualGPANum < 2.0){
                                gpaLabel.textColor = UIColor.red
                            }
                            else if(actualGPANum >= 2.0 && actualGPANum < 3){
                                gpaLabel.textColor = UIColor.orange
                            }
                            else{
                                gpaLabel.textColor = UIColor.green
                            }
                        }
                        else if(courseLabel1.isHidden && courseLabel2.isHidden == false && courseLabel3.isHidden == false && courseLabel4.isHidden == false){
                            actualGPANum = (gpaLabel2ForCalc + gpaLabel3ForCalc + gpaLabel4ForCalc)/totalCreditsNum
                            gpaLabel.text = "GPA: \(actualGPANum)"
                            if(actualGPANum < 2.0){
                                gpaLabel.textColor = UIColor.red
                            }
                            else if(actualGPANum >= 2.0 && actualGPANum < 3){
                                gpaLabel.textColor = UIColor.orange
                            }
                            else{
                                gpaLabel.textColor = UIColor.green
                            }
                        }
                        else if(courseLabel1.isHidden && courseLabel2.isHidden && courseLabel3.isHidden == false && courseLabel4.isHidden){
                            actualGPANum = gpaLabel3ForCalc/totalCreditsNum
                            gpaLabel.text = "GPA: \(actualGPANum)"
                            if(actualGPANum < 2.0){
                                gpaLabel.textColor = UIColor.red
                            }
                            else if(actualGPANum >= 2.0 && actualGPANum < 3){
                                gpaLabel.textColor = UIColor.orange
                            }
                            else{
                                gpaLabel.textColor = UIColor.green
                            }
                        }
                        else if(courseLabel1.isHidden && courseLabel2.isHidden && courseLabel3.isHidden == false && courseLabel4.isHidden == false){
                            actualGPANum = (gpaLabel3ForCalc + gpaLabel4ForCalc)/totalCreditsNum
                            gpaLabel.text = "GPA: \(actualGPANum)"
                            if(actualGPANum < 2.0){
                                gpaLabel.textColor = UIColor.red
                            }
                            else if(actualGPANum >= 2.0 && actualGPANum < 3){
                                gpaLabel.textColor = UIColor.orange
                            }
                            else{
                                gpaLabel.textColor = UIColor.green
                            }
                        }
                        else if(courseLabel1.isHidden && courseLabel2.isHidden && courseLabel3.isHidden && courseLabel4.isHidden == false){
                            actualGPANum = gpaLabel4ForCalc/totalCreditsNum
                            gpaLabel.text = "GPA: \(actualGPANum)"
                            if(actualGPANum < 2.0){
                                gpaLabel.textColor = UIColor.red
                            }
                            else if(actualGPANum >= 2.0 && actualGPANum < 3){
                                gpaLabel.textColor = UIColor.orange
                            }
                            else{
                                gpaLabel.textColor = UIColor.green
                            }
                        }
                            
                        else{
                            let alert = UIAlertController(title: "Error", message: "Major Problem",preferredStyle: .alert)
                            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                            alert.addAction(cancelAction)
                            present(alert, animated: true, completion: nil)
                            
                        }
                        
                        
                        
                        
                        
                        //gpa label end
                        
                        
                        if(boolVal == false){
                            let alert = UIAlertController(title: "Error", message: "Cannot add more than 4 Courses",preferredStyle: .alert)
                            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                            alert.addAction(cancelAction)
                            present(alert, animated: true, completion: nil)
                        }
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
        else{
            let alert = UIAlertController(title: "Error", message: "Cannot add same course",preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(cancelAction)
            present(alert, animated: true, completion: nil)
        }
    	}
        
        
        
        @IBAction func deleteLabel(_ sender: UIButton){
            let deletingClassNumber = Int(deleteClassNum.text!)
            if(deletingClassNumber == 1 && courseLabel1.isHidden == false){
                courseLabel1.isHidden = true
                courseLabel1.text = ""
                course1A.isHidden = true
                course1B.isHidden = true
                course1C.isHidden = true
                course1D.isHidden = true
                course1F.isHidden = true
            }
                
            else if(deletingClassNumber == 2 && courseLabel2.isHidden == false){
                courseLabel2.isHidden = true
                courseLabel2.text = ""
                course2A.isHidden = true
                course2B.isHidden = true
                course2C.isHidden = true
                course2D.isHidden = true
                course2F.isHidden = true
            }
                
            else if(deletingClassNumber == 3 && courseLabel3.isHidden == false){
                courseLabel3.isHidden = true
                courseLabel3.text = ""
                course3A.isHidden = true
                course3B.isHidden = true
                course3C.isHidden = true
                course3D.isHidden = true
                course3F.isHidden = true
            }
                
            else if(deletingClassNumber == 4 && courseLabel4.isHidden == false){
                courseLabel4.isHidden = true
                courseLabel4.text = ""
                course4A.isHidden = true
                course4B.isHidden = true
                course4C.isHidden = true
                course4D.isHidden = true
                course4F.isHidden = true
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

