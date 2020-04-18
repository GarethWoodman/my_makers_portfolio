require './lib/roman_numeral_converter'

describe 'RomanNumeralConverter' do
  roman_calculator = RomanNumeralConverter.new

  it 'returns I when passed 1' do
    expect(roman_calculator.convert(1)).to eq("I")
  end
  it 'returns II when passed 2' do
    expect(roman_calculator.convert(2)).to eq("II")
  end
  it 'returns III when passed 3' do
    expect(roman_calculator.convert(3)).to eq("III")
  end
  it 'returns IV when passed 4' do
    expect(roman_calculator.convert(4)).to eq("IV")
  end
  it 'returns V when passed 5' do
    expect(roman_calculator.convert(5)).to eq("V")
  end
  it 'returns VI when passed 6' do
    expect(roman_calculator.convert(6)).to eq("VI")
  end
  it 'returns VII when passed 7' do
    expect(roman_calculator.convert(7)).to eq("VII")
  end
  it 'returns VIII when passed 8' do
    expect(roman_calculator.convert(8)).to eq("VIII")
  end
  it 'returns IX when passed 9' do
    expect(roman_calculator.convert(9)).to eq("IX")
  end
  it 'returns X when passed 10' do
    expect(roman_calculator.convert(10)).to eq("X")
  end
  it 'returns LXIX when passed 69' do
    expect(roman_calculator.convert(69)).to eq("LXIX")
  end
  it 'returns CXCII when passed 192' do
    expect(roman_calculator.convert(192)).to eq("CXCII")
  end
  it 'returns MLXXVII when passed 1077' do
    expect(roman_calculator.convert(1077)).to eq("MLXXVII")
  end
  it 'returns MMM when passed 3000' do
    expect(roman_calculator.convert(3000)).to eq("MMM")
  end
end
