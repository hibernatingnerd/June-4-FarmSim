# require "pry"
class Crop

  @@things_you_can_plant = ["corn", "wheat"]

  attr_accessor :type, :size

  def initialize(type, size)
    if @@things_you_can_plant.include?(type)
      @type = type
      @size = size
    else
      puts "please enter a valid vegatable. Enter 1 to see a list."
      case (gets.to_i)
      when 1
      Crop.show_all_plants
      end
    end
  end

  def self.show_all_plants
    @@things_you_can_plant.each {|v| puts "#{v}" }
  end

end

# binding.pry
