//
//  ViewController.swift
//  Counter
//
//  Created by Medina Huseynova on 26.07.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    private var counter = 0 {
        didSet {
            updateCounterLabel()
        }
    }
    
    private var history: [String] = ["История изменений:"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Initial setup
        counterLabel.text = "0"
        textView.text = history.joined(separator: "\n")
        
    }
    
    @IBAction func increaseButtonTapped(_ sender: UIButton) {
        counter += 1
        updateHistory(message: "\(formattedDate()): значение изменено на +1")
    }
    
    @IBAction func decreaseButtonTapped(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
            updateHistory(message: "\(formattedDate()): значение изменено на -1")
        } else {
            updateHistory(message: "\(formattedDate()): попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        counter = 0
        updateHistory(message: "\(formattedDate()): значение сброшено")
    }
    
    private func updateCounterLabel() {
        counterLabel.text = "Значение счётчика: \(counter)"
    }
    
    private func updateHistory(message: String) {
        history.append(message)
        textView.text = history.joined(separator: "\n")
        // Automatically scroll to the bottom of the UITextView
        let bottom = NSRange(location: textView.text.count - 1, length: 1)
        textView.scrollRangeToVisible(bottom)
    }
    
    private func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter.string(from: Date())
    }
}
        
        
