//
//  ViewController.swift
//  tictactoe
//
//  Created by Rishabh Bhandari on 31/05/19.
//  Copyright © 2019 Rishabh Bhandari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var turnLabel: UILabel!
    
    
    @IBOutlet weak var label11: UILabel!
    @IBOutlet weak var label12: UILabel!
    @IBOutlet weak var label13: UILabel!
    @IBOutlet weak var label21: UILabel!
    @IBOutlet weak var label22: UILabel!
    @IBOutlet weak var label23: UILabel!
    @IBOutlet weak var label31: UILabel!
    @IBOutlet weak var label32: UILabel!
    @IBOutlet weak var label33: UILabel!
    
    
    var player1:Bool = true
    var draw:Bool = false
    
    
    @IBAction func turn(_ sender: UIButton) {
        if player1 {
            
            if sender.tag == 11 {
                
                label11.text = "X"
                print("Hello")
            }
            else if sender.tag == 12 {
                
                label12.text = "X"
            }
            else if sender.tag == 13 {
                
                label13.text = "X"
            }
            else if sender.tag == 21 {
                
                label21.text = "X"
            }
            else if sender.tag == 22 {
                
                label22.text = "X"
            }
            else if sender.tag == 23 {
                
                label23.text = "X"
            }
            else if sender.tag == 31 {
                
                label31.text = "X"
            }
            else if sender.tag == 32 {
                
                label32.text = "X"
            }
            else if sender.tag == 33 {
                
                label33.text = "X"
            }
            checkResult()
            player1 = false
            turnLabel.text = "Player 2's Turn"
            
        }
        
        else {
            if sender.tag == 11 {
                
                label11.text = "O"
                print("Hello")
            }
            else if sender.tag == 12 {
                
                label12.text = "O"
            }
            else if sender.tag == 13 {
                
                label13.text = "O"
            }
            else if sender.tag == 21 {
                
                label21.text = "O"
            }
            else if sender.tag == 22 {
                
                label22.text = "O"
            }
            else if sender.tag == 23 {
                
                label23.text = "O"
            }
            else if sender.tag == 31 {
                
                label31.text = "O"
            }
            else if sender.tag == 32 {
                
                label32.text = "O"
            }
            else if sender.tag == 33 {
                
                label33.text = "O"
            }
            checkResult()
            
            player1 = true
            turnLabel.text = "Player 1's Turn"
        }
        
    }
    
    func checkResult() {
        
        
        
        if label11.text == label12.text && label12.text == label13.text && label11.text != "" && label13.text != "" && label12.text != "" {
            
            showAlert(player1, draw)
        }
       else if label11.text == label22.text && label22.text == label33.text && label11.text != "" && label22.text != "" && label33.text != "" {
            showAlert(player1, draw)
        }
        else if label13.text == label22.text && label22.text == label31.text && label13.text != "" && label22.text != "" && label31.text != "" {
            showAlert(player1, draw)
        }
        else if label21.text == label22.text && label22.text == label23.text && label21.text != "" && label22.text != "" && label23.text != ""{
            showAlert(player1, draw)
        }
        else if label31.text == label32.text && label32.text == label33.text && label31.text != "" && label32.text != "" && label33.text != "" {
            showAlert(player1, draw)
        }
        else if label11.text == label21.text && label21.text == label31.text && label11.text != "" && label21.text != "" && label31.text != "" {
            showAlert(player1,draw)
        }
        else if label12.text == label22.text && label22.text == label32.text && label12.text != "" && label22.text != "" && label32.text != "" {
            showAlert(player1,draw)
        }
        else if label13.text == label23.text && label23.text == label33.text && label13.text != "" && label23.text != "" && label33.text != "" {
            showAlert(player1,draw)
            
        }
        
        
            
        else if label11.text != "" && label12.text != "" && label13.text != "" && label21.text != "" && label22.text != "" && label23.text != "" && label31.text != "" && label32.text != "" && label33.text != "" {
            
            draw = true
            
            showAlert(player1, draw)
            
        }
        
        
    }
    
    @IBAction func resetGame(_ sender: Any) {
        newGame()
    }
    func newGame() {
        
        draw = false
        
        label11.text = ""
        label12.text = ""
        label13.text = ""
        label21.text = ""
        label22.text = ""
        label23.text = ""
        label31.text = ""
        label32.text = ""
        label33.text = ""
        player1 = true
        turnLabel.text = "Player 1's Turn"
        
    }
    func showAlert(_ Play:Bool , _ draw:Bool) {
        var mess = ""
        var title = ""
        if draw {
            
            mess = "It's a draw"
            title = "OOPS!"
        }
        
        else if Play {
            mess = "Player 1 Wins"
            title = "Congratulations!"
        }
        else if !Play {
            mess = "Player 2 Wins"
            title = "Congratulations!"
        }
        
            
        var alert = UIAlertController(title: title, message: mess, preferredStyle: .alert)
        
        var action = UIAlertAction(title:"New Game?", style: .default, handler: {
            action in
            self.newGame()
        })
        alert.addAction(action)
        present(alert,animated: true, completion: nil)
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    }

@IBDesignable extension UIButton {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}


