//
//  ViewController.swift
//  MyApp03
//
//  Created by iii on 2017/6/20.
//  Copyright © 2017年 iii. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var textHistory: UITextView!
    
    private var stringAnswer:String?
    private var counter = 0
    
    @IBAction func clickGuess(_ sender: Any) {
        counter += 1
        let stringInput = textInput.text!
        
        let stringResult = BradAPI.checkAB(answer: stringAnswer!,
                                           guess:stringInput)
        labelResult.text = stringResult
        
        textHistory.text.append("\(counter). \(stringInput) => \(stringResult)\n")
        textInput.text = ""
        
        if stringResult == "3A0B" {
            showWinnerDialog()
        }else if counter == 10 {
            showLoserDialog()
        }
        
    }

    func showWinnerDialog() {
        let alert:UIAlertController = UIAlertController(title: "遊戲結果", message: "恭喜老爺, 賀喜夫人", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
            (action: UIAlertAction) -> Void in
            print("OK")
        })
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func showLoserDialog() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stringAnswer = BradAPI.createAnswer(3)
        //print(stringAnswer!)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

