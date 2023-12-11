def main
    rice_cooker = RiceCooker.new
  
    loop do
      puts "\nMenu:"
      puts "1 - Faire bouillir de l'eau"
      puts "2 - Cuisiner du riz"
      puts "0 - Quitter"
  
      print "Choisissez une option : "
      choice = gets.chomp
  
      case choice
      when "1"
        print "Choisissez la quantité d'eau (1 pour 1 litre, 2 pour 2 litres) : "
        water_quantity_choice = gets.chomp
        rice_cooker.boil_water(water_quantity_choice)
      when "2"
        print "Choisissez le type de riz (1(riz blanc) / 2(riz brun) : "
        rice_type = gets.chomp
        rice_cooker.cook_rice(rice_type)
      when "0"
        puts "Au revoir !"
        break
      else
        puts "Option non valide. Veuillez choisir à nouveau."
      end
    end
  rescue Interrupt
    puts "\nProgramme interrompu par l'utilisateur. Au revoir!"
  end
  
  if __FILE__ == $0
    main
  end