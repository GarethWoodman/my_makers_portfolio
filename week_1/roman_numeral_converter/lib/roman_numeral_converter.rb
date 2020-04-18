class RomanNumeralConverter
  def convert(number)
    #Take array of figures in number and reverse it, ex. 123 => [3,2,1]
    numbers = number.to_s.split('').reverse

    #Loop Through numbers and get a roman numeral for each figure
    #First figure in array is for 1's
    #Second figure is 10's
    #Third figure is 100's
    roman_numerals = numbers.map.with_index do |number, index|
      add_symbols(number.to_i, index * 2 )
    end

    #Reverse array so that roman numerals are in the correct order then join
    roman_numerals.reverse.join
  end

  private
  def add_symbols(number, index)

    if number < 4
      return get_symbol(index) * number
    end

    if number == 4
      return get_symbol(index) + get_symbol(index + 1)
    end

    if number >= 5 && number < 9
      return get_symbol(index + 1) + ( get_symbol(index) * ( number - 5 ) )
    end

    if number == 9
      return get_symbol(index) + get_symbol(index + 2)
    end

  end

  def get_symbol(index)
    numerals = ["I", "V", "X", "L", "C", "D", "M"]
    numerals[index]
  end
end
