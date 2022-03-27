//
//  ViewController.swift
//  Zufallszahlengenerator
//
//  Created by Karolina Sulik on 21.03.22.
//

import UIKit

class ViewController: UIViewController {

    
    //let numbers = [[1,2,3],[4,5,6]] //2 -> numbers[0][1]
    //man kann auch in folgender Weise ein zweidimensionales Array schaffen:
    let numbers = [Array(1...100), Array(1...100)]
    
    var startNumber = 25
    var endNumber = 75
    
    
    //MARK: - Outlets
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var chooseButton: UIButton!
    
    
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.delegate = self
        picker.dataSource = self
        picker.selectRow(startNumber - 1, inComponent: 0, animated: true)
        picker.selectRow(endNumber - 1, inComponent: 1, animated: true)
        
        chooseButton.layer.cornerRadius = 22
        resultLabel.layer.cornerRadius = 22
        chooseButton.setTitle("Zahl zwischen \(startNumber) und \(endNumber) wählen", for: .normal)
        
        
        view.backgroundColor = UIColor(named: "BackgroundOfZufallszahlengenerator")
        picker.tintColor = UIColor(named: "PickerTint")
        
    }

    
    //MARK: - Button Action
    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        if startNumber < endNumber {
            let randomNumber = Int.random(in: startNumber...endNumber)
            resultLabel.text = "\(randomNumber)"
        }
    }
    
    func setButton() {
        if startNumber  < endNumber {
            chooseButton.setTitle("Zahl zwischen \(startNumber) und \(endNumber) wählen", for: .normal)
        } else {
            chooseButton.setTitle("Achtung Startwert >= Endwert", for: .normal)
        }
       
        
    }
    
}




//MARK: - Extensions
extension ViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            startNumber = numbers[component][row]
        } else if component == 1 {
            endNumber = numbers[component][row]
        }
        setButton()
    }
    
    
}


extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return numbers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers[0].count
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return "\(numbers[component][row])"
//    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: "\(numbers[component][row])", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "PickerTint")])
    }
    
}
