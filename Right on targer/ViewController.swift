//
//  ViewController.swift
//  Right on targer
//
//  Created by Andrey Rusinovich on 19.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var game = Game(startValue: 1, endValue: 50, rounds: 3)!
    
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        label.text = String(game.currentSecretValue)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear")
    }
    
    //MARK: - Actions
    
    @IBAction func checkNumber() {
        let numSlider = Int(self.slider.value.rounded())
        
        game.calculateScore(with: numSlider)
        
        if game.isGameEnded {
            showAlert()
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithText(newText: String(game.currentSecretValue))
    }
    
    //MARK: - View
    
    private func updateLabelWithText(newText: String) {
        label.text = newText
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Game over", message: "You earned \(game.score) points", preferredStyle: .alert)
        let action = UIAlertAction(title: "New game", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
}

