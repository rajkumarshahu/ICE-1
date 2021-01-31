//
//  ViewController.swift
//  ICE-1
//
//  Created by Raj Kumar Shahu on 2021-01-27.
//

import UIKit

class ViewController: UIViewController {
    
    var grapes = 0
    var bananas = 0
    var oranges = 0
    var cherries = 0
    var bars = 0
    var bells = 0
    var sevens = 0
    var blanks = 0
    var winnings = 0
    var playerBet = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
             
    }
    
    @IBAction func btnSpin(_ sender: UIButton) {

        resetAll()
        print("===============================")
        print(spinReels())
        print("-------------------------------")
        determineWinnings()
        print("===============================")
    }
    
    
    /* Utility function to check if a value falls within a range of bounds */
    func checkRange(value : Int, lowerBounds : Int, upperBounds : Int) -> Int {
        return (value >= lowerBounds && value <= upperBounds) ? value : -1
    }
    
    /* When this function is called it determines the betLine results.
     e.g. Bar - Orange - Banana */
    func spinReels() -> [String] {
        
        var betLine = [" ", " ", " "]
        var outCome = [0, 0, 0]
        
        for spin in 0...2 {
            
            outCome[spin] = Int.random(in: 1..<66)
            
            switch (outCome[spin]) {
            
            case checkRange(value: outCome[spin], lowerBounds: 1, upperBounds: 27):  // 41.5% probability
                betLine[spin] = "Blank"
                blanks = blanks + 1
                
            case checkRange(value: outCome[spin], lowerBounds: 28, upperBounds: 37): // 15.4% probability
                betLine[spin] = "Grapes"
                grapes = grapes + 1
                
            case checkRange(value: outCome[spin], lowerBounds: 38, upperBounds: 46): // 13.8% probability
                betLine[spin] = "Banana"
                bananas = bananas + 1
                
            case checkRange(value: outCome[spin], lowerBounds: 47, upperBounds: 54): // 12.3% probability
                betLine[spin] = "Orange"
                oranges = oranges + 1
                
            case checkRange(value: outCome[spin], lowerBounds: 55, upperBounds: 59): //  7.7% probability
                betLine[spin] = "Cherry"
                cherries = cherries + 1
                
            case checkRange(value: outCome[spin], lowerBounds: 60, upperBounds: 62): //  4.6% probability
                betLine[spin] = "Bar"
                bars = bars + 1
                
            case checkRange(value: outCome[spin], lowerBounds: 63, upperBounds: 64): //  3.1% probability
                betLine[spin] = "Bell";
                bells = bells + 1
                
            case checkRange(value: outCome[spin], lowerBounds: 65, upperBounds: 65): //  1.5% probability
                betLine[spin] = "Seven";
                sevens = sevens + 1
                
            default:
                print("Error occured!!!")
            }
        }
        return betLine
    }
    
    
    
    /* This function calculates the player's winnings, if any */
    func determineWinnings()  {
        
        if (blanks == 0) {
            if (grapes == 3) {
                winnings = playerBet * 10
            }
            else if (bananas == 3) {
                winnings = playerBet * 20
            }
            else if (oranges == 3) {
                winnings = playerBet * 30
            }
            else if (cherries == 3) {
                winnings = playerBet * 40
            }
            else if (bars == 3) {
                winnings = playerBet * 50
            }
            else if (bells == 3) {
                winnings = playerBet * 75;
            }
            else if (sevens == 3) {
                winnings = playerBet * 100;
            }
            else if (grapes == 2) {
                winnings = playerBet * 2;
            }
            else if (bananas == 2) {
                winnings = playerBet * 2;
            }
            else if (oranges == 2) {
                winnings = playerBet * 3;
            }
            else if (cherries == 2) {
                winnings = playerBet * 4;
            }
            else if (bars == 2) {
                winnings = playerBet * 5;
            }
            else if (bells == 2) {
                winnings = playerBet * 10;
            }
            else if (sevens == 2) {
                winnings = playerBet * 20;
            }
            else if (sevens == 1) {
                winnings = playerBet * 5;
            }
            else {
                winnings = playerBet * 1;
            }
            
            print("Win!");
            winnings = winnings + winnings
            print(winnings )
        }
        else {
            print("Loss!");
        }
        
    }
    
    
    func resetAll() {
        grapes = 0
        bananas = 0
        oranges = 0
        cherries = 0
        bars = 0
        bells = 0
        sevens = 0
        blanks = 0
        winnings = 0
        playerBet = 20
    }
    
    
}

