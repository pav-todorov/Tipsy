import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!

    var tipsyBrain = TipsyBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        tipsyBrain.getPercent(percentValue: sender)
        
        billTextField.endEditing(true)

    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        tipsyBrain.getNumberOfPeople(numberOfPeople: sender)

    }
    
    
//    splitNumberLabel.text = String(format: "%.0f", sender.value)
//            numberOfPeople = Int(sender.value)

    
    @IBAction func calculatePressed(_ sender: UIButton) {

        tipsyBrain.getBill(bill: billTextField)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.settingsText = tipsyBrain.getLabelText()
            destinationVC.total = tipsyBrain.getResult()

        }
    }
}
