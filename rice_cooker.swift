class RiceCooker {
    var waterLevel: Float = 0

    func addWater(amount: Float) {
        let maxCapacity: Float = 2
        if waterLevel + amount > maxCapacity {
            print("Capacité maximale du Rice Cooker atteinte (\(maxCapacity) litres).")
        } else {
            waterLevel += amount
            print("\(amount) litre(s) d'eau ajouté(s).")
        }
    }

    func boilWater(waterQuantityChoice: String) {
        let maxCapacity: Float = 2

        guard let waterQuantity = Float(waterQuantityChoice) else {
            if let newQuantity = Float(readLine() ?? "") {
                boilWater(waterQuantityChoice: String(newQuantity))
            }
            return
        }

        if waterQuantity == 0 {
            print("Ajoutez de l'eau d'abord.")
            if let newQuantity = Float(readLine() ?? "") {
                boilWater(waterQuantityChoice: String(newQuantity))
            }
            return
        }

        if waterQuantity <= 0 {
            print("Choix de quantité d'eau non valide.")
            if let newQuantity = Float(readLine() ?? "") {
                boilWater(waterQuantityChoice: String(newQuantity))
            }
            return
        }

        if waterQuantity > maxCapacity {
            print("Entrez une nouvelle quantité d'eau : ")
            if let newQuantity = Float(readLine() ?? "") {
                boilWater(waterQuantityChoice: String(newQuantity))
            }
            return
        }

        if waterQuantity == maxCapacity {
            print("Attention : Vous avez atteint la capacité maximale du Rice Cooker (2 litres).")
            let boilingTimes: [Float: Int] = [2: 5]
            if let boilingTime = boilingTimes[waterQuantity] {
                print("L'eau bout pendant \(boilingTime) secondes.")
                print("Le Rice Cooker est en train de bouillir de l'eau.")
                Timer.runTimer(seconds: boilingTime)
                print("L'eau est bouillie.")
            } else {
                print("Choix de quantité d'eau non valide.")
            }
        }

        let boilingTimes: [Float: Int] = [1: 3]
        if let boilingTime = boilingTimes[waterQuantity] {
            print("L'eau bout pendant \(boilingTime) secondes.")
            print("Le Rice Cooker est en train de bouillir de l'eau.")
            Timer.runTimer(seconds: boilingTime)
            print("L'eau est bouillie.")
        } else {
            print("Choix de quantité d'eau non valide.")
        }
    }

    func cookRice(riceType: String) {
        if waterLevel == 0 {
            print("Ajoutez de l'eau d'abord.")
            print("Entrez la quantité d'eau (en litres, ne dépassez pas 2 litres) : ")
            if let waterQuantity = Float(readLine() ?? ""), 0 < waterQuantity, waterQuantity <= 2 {
                addWater(amount: waterQuantity)
            } else {
                print("Quantité d'eau non valide. Assurez-vous que la quantité est comprise entre 0 et 2 litres.")
                return
            }
        }

        var riceTypeDisplay: String = ""
        while true {
            switch riceType {
            case "1":
                riceTypeDisplay = "riz blanc"
                break
            case "2":
                riceTypeDisplay = "riz brun"
                break
            default:
                print("Choix non valide. Veuillez choisir '1' pour 'riz blanc' ou '2' pour 'riz brun'.")
            }

            print("Entrez à nouveau le type de riz : ")
            if let newRiceType = readLine() {
                riceType = newRiceType
                break
            }
        }

        let cookingTimes: [String: Int] = ["1": 7, "2": 10]
        if let cookingTime = cookingTimes[riceType] {
            print("Le \(riceTypeDisplay) cuit pendant \(cookingTime) secondes.")
            print("Le RiceCooker est en train de cuire votre \(riceTypeDisplay).")
            Timer.runTimer(seconds: cookingTime)
            print("Le \(riceTypeDisplay) est cuit.")
        } else {
            print("Choix de type de riz non valide.")
        }
    }
}
