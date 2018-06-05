require_relative 'crop'
# require "pry"
class Farm < Crop

  def initialize
    @field = []
    @total_harvest = 0
  end

  def show_fields
    @field
  end

  # call main menu indefinitely
  def main_menu
    while true
      print_main_menu
      user_selected = gets.chomp.to_s
      call_option(user_selected)
    end
  end


  def print_main_menu
    puts  "________________________________________________________"
    puts  "@@ WELCOME TO THE HOMESTEAD FARM @@"
    puts  "-------------------------------------"
    puts  "# field -> adds a new field"
    puts  "# harvest -> harvests crops and adds to total harvested"
    puts  "# status -> displays some information about the farm"
    puts  "# relax -> provides lovely descriptions of your fields"
    puts  "# exit -> exits the program"
    puts  "                            +&-             "
    puts  " If you lived here,        _.-^-._    .--.  "
    puts  "  you'd be home now...   -'   _   '-. |__|  "
    puts  "                       /     |_|     \|  |  "
    puts  "                      /               \  |  "
    puts  "                     /|     _____     |\ |  "
    puts  "                      |    |==|==|    |  |  "
    puts  "  |---|---|---|---|---|    |--|--|    |  |  "
    puts  "  |---|---|---|---|---|    |==|==|    |  |  "
    puts  "  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
    puts  "_________________________________________________________"
  end

end

def call_option(selection)
  case selection
  when "field"
    puts "What kind of field is it: corn or wheat?"
    type = gets.chomp.to_s
    puts "How large is the field in hectares?"
    size = gets.to_i
    @field << Crop.new(type, size)
    puts "Added a #{type} field of #{size} hectares!"
  when "harvest"
    #harvest the existing crops in field array
    self.harvest
    # The farm has 0 harvested food so far.
  when "status"
# status -> displays some information about the farm
    self.status
    self.total_harvest

  when "relax"
    #relax discrption for each item in the field array
    self.relax

  when "exit"
    exit
  end

  def harvest
    @field.each {|crop|
      puts "Your strange fields of #{crop.type} yield #{crop.yield}"
      @total_harvest += crop.yield }
      @field = []
    puts "The farm has stored #{@total_harvest} pounds of food for the coming dark."
  end

  def status
    show_fields.each {|food|
      puts "#{food.type} field is #{food.size} hectares."
    }
  end

  def relax
    show_fields.each {|food|
      if food.type == 'corn'
        puts "#{food.size} hectares of odd green stalks rustle in the breeze. Something seems unsettled. Jupiter rises over R'lyeh."
      end
      if food.type == 'wheat'
        puts "The sun hangs low, casting an errie orange glow on a #{food.size} hectares of wheat. Strange movements catch your eye."
      end
    }
  end

  def total_harvest
    puts "The farm has #{@total_harvest} pounds of food for the ritual."
  end
end
# runapp = Farm.new
# binding.pry
