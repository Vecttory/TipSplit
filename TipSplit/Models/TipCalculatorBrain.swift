
struct TipCalculatorBrain{
    var tip: Tip?
    
    mutating func calculateTip(amount: Float, people: Int, percentage: Float) {
        
        let enteredAmountPlusTip = amount + (amount * percentage)
        let totalEach = enteredAmountPlusTip / Float(people)
        
        let message = getSettingsText(people: people, percentage: percentage)
        
        tip = Tip(amount: amount, people: people, percentage: percentage, totalEach: totalEach, message: message)
        
    }
    
    func getSettingsText(people: Int, percentage: Float) -> String {
        let pctToInt = Int(percentage * 100)
        let formattedText = String(format: "Split between %d people, with %d%% tip.", people, pctToInt)
        return formattedText
    }
    
    func getMessage() -> String {
        return tip?.message ?? ""
    }
    
    func getTotalEachToString() -> String {
        
        if let safeTotalEach = tip?.totalEach {
            let totalEachToString = String(format: "%.2f", safeTotalEach)
            return totalEachToString
        }

        return "0.0"
    }
}
