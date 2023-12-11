func main() {
    let riceCooker = RiceCooker()

    while true {
        print("\nMenu:")
        print("1 - Faire bouillir de l'eau")
        print("2 - Cuisiner du riz")
        print("0 - Quitter")

        print("Choisissez une option : ")
        if let choice = readLine() {
            switch choice {
            case "1":
                print("Choisissez la quantité d'eau (1 pour 1 litre, 2 pour 2 litres) : ")
                if let waterQuantityChoice = readLine() {
                    riceCooker.boilWater(waterQuantityChoice: waterQuantityChoice)
                }
            case "2":
                print("Choisissez le type de riz (1(riz blanc) / 2(riz brun) : ")
                if let riceType = readLine() {
                    riceCooker.cookRice(riceType: riceType)
                }
            case "0":
                print("Au revoir !")
                return
            default:
                print("Option non valide. Veuillez choisir à nouveau.")
            }
        }
    }
}

main()
