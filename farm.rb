require_relative 'crop'
require "pry"
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
    puts  "@@ WELCOME TO THE HOMESTEAD FARM @@"
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
    show_fields.each {|food|
    }
    # The farm has 0 harvested food so far.
  when "status"
# status -> displays some information about the farm
    self.status

  when "relax"
    #relax discrption for each item in the field array
  when "exit"
    exit
  end

  def harvest
    @field.each {|crop|
      puts "Your strange fields of #{crop.type} yield "
      @total_harvest += crop.size }
  end

  def status
    show_fields.each {|food|
      puts "#{food.type} field is #{food.size} hectares."
    }
  end


end
runapp = Farm.new
binding.pry
