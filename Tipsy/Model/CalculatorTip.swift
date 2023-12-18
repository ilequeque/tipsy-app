import UIKit

struct CalculatorTip {
    
    var billValue = 0.0
    var numberOfPeople = 2
    var tip = 0.10
    var resultTotal = ""
    
    mutating func calculate(bill: Double, tip: Double, numberOfPeople: Int){
        let result = bill * (1 + tip) / Double(numberOfPeople)
        resultTotal = String(format: "%.2f", result)
    }
    
    func getTipValue() -> Double {
        return tip
    }
    
    func getNumberOfPeople() -> Int {
        return numberOfPeople
    }
    
    func getTotalResult() -> String {
        return resultTotal
    }
}
