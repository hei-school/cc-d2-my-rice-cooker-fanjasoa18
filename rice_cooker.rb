class RiceCooker
    def initialize
      @water_level = 0
    end
  
    def add_water(amount)
      max_capacity = 2
      if @water_level + amount > max_capacity
        puts "Capacité maximale du Rice Cooker atteinte (#{max_capacity} litres)."
      else
        @water_level += amount
        puts "#{amount} litre(s) d'eau ajouté(s)."
      end
    end
  
    def boil_water(water_quantity_choice)
      max_capacity = 2
  
      begin
        water_quantity_choice = Float(water_quantity_choice)
      rescue ArgumentError
        new_quantity = Float(gets.chomp)
        boil_water(new_quantity)
        return
      end
  
      if water_quantity_choice == 0
        puts "Ajoutez de l'eau d'abord."
        new_quantity = Float(gets.chomp)
        boil_water(new_quantity)
        return
      end
  
      if water_quantity_choice <= 0
        puts "Choix de quantité d'eau non valide."
        new_quantity = Float(gets.chomp)
        boil_water(new_quantity)
        return
      end
  
      if water_quantity_choice > max_capacity
        new_quantity = Float(gets.chomp)
        boil_water(new_quantity)
        return
      end
  
      if water_quantity_choice == max_capacity
        puts "Attention : Vous avez atteint la capacité maximale du Rice Cooker (2 litres)."
        boiling_times = { 2 => 5 }
        boiling_time = boiling_times[water_quantity_choice]
        if boiling_time
          puts "L'eau bout pendant #{boiling_time} secondes."
          puts "Le Rice Cooker est en train de bouillir de l'eau."
          Timer.run_timer(boiling_time)
          puts "L'eau est bouillie."
        else
          puts "Choix de quantité d'eau non valide."
        end
      end
  
      boiling_times = { 1 => 3 }
      boiling_time = boiling_times[water_quantity_choice]
  
      if boiling_time
        puts "L'eau bout pendant #{boiling_time} secondes."
        puts "Le Rice Cooker est en train de bouillir de l'eau."
        Timer.run_timer(boiling_time)
        puts "L'eau est bouillie."
      else
        puts "Choix de quantité d'eau non valide."
      end
    end
  
    def cook_rice(rice_type)
      if @water_level == 0
        puts "Ajoutez de l'eau d'abord."
        print "Entrez la quantité d'eau (en litres, ne dépassez pas 2 litres) : "
        water_quantity = Float(gets.chomp)
  
        if 0 < water_quantity <= 2
          add_water(water_quantity)
        else
          puts "Quantité d'eau non valide. Assurez-vous que la quantité est comprise entre 0 et 2 litres."
          return
        end
      end
  
      cooking_times = { "1" => 7, "2" => 10 }
  
      loop do
        if rice_type == '1'
          rice_type_display = 'riz blanc'
          break
        elsif rice_type == '2'
          rice_type_display = 'riz brun'
          break
        else
          puts "Choix non valide. Veuillez choisir '1' pour 'riz blanc' ou '2' pour 'riz brun'."
        end
        print "Entrez à nouveau le type de riz : "
        rice_type = gets.chomp
      end
  
      cooking_time = cooking_times[rice_type]
      rice_type_display = (rice_type == '1') ? 'riz blanc' : 'riz brun'
      puts "Le #{rice_type_display} cuit pendant #{cooking_time} secondes."
      puts "Le RiceCooker est en train de cuire votre #{rice_type_display}."
      Timer.run_timer(cooking_time)
      puts "Le #{rice_type_display} est cuit."
    end
  end