class SolarModule < ActiveRecord::Base

  def display
    brand + " " + model + " (Nominal Wattage: " + nominal_wattage.to_s + ")"
  end
  
end
