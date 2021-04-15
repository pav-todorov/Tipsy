import UIKit

struct TipsyBrain {
    var numberOfPeople:Float?
    var percentValue:Float?
    var billValue:Float?
    
    var percentTip:Float?
    var result:Float?
    
    
    mutating func getNumberOfPeople(numberOfPeople: UIStepper) {
        self.numberOfPeople = Float(numberOfPeople.value)
    }
    
    mutating func getPercent(percentValue:UIButton) {
        let selectedPercent = percentValue.currentTitle!.trimmingCharacters(in: CharacterSet(charactersIn: "%"))
        self.percentValue = Float(selectedPercent)
        self.percentValue = self.percentValue!/100
    }
    

    mutating func getBill(bill: UITextField) {
        self.billValue = Float(bill.text ?? "0.0")
    }
    
    mutating func printResult() -> String{
        
        percentTip = (billValue ?? 0.0) * (percentValue ?? 0.1)
        result = ( (billValue ?? 0.0) + (percentTip ?? 0.0) ) / (numberOfPeople ?? 2.0)
    
        return String(result ?? 0.0)
        
    }
    
    var convertedToFullPercent:Float?
    var percentFloatToText:String?
    var fullText:String = "nothing"
    
    
    mutating func getLabelText() -> String {
        convertedToFullPercent = (percentValue ?? 0.1) * 100.0
        percentFloatToText = (String(format: "%.0f", convertedToFullPercent!))
        let numberOfPeopleInt = String(format: "%.0f", (numberOfPeople ?? 2.0))
        fullText = "Split between \(numberOfPeopleInt) people, with \(percentFloatToText ?? "10")% tip."
        
        return fullText
    }
    
    func getResult() -> String {
        return String(result ?? 0.0)
    }
    
}
