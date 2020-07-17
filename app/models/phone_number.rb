class PhoneNumber < ApplicationRecord
  validates_length_of :number, is:10, message: "Number must be 10 digit long"

  # for generate number from this range
  def self.generate_phone_number
    number = rand(1111111111..9999999999)
    phone_number = PhoneNumber.check_number number
  end

  # for check number already in database or not. If number already there then it call to generate number for new number
  def self.check_number number
    numbers = PhoneNumber.all.pluck(:number)
    numbers = numbers.reject(&:empty?).map(&:to_i)
    if numbers.include? (number)
      PhoneNumber.generate_phone_number
    else
      number
    end
  end
end
