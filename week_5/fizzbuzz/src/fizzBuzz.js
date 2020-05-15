class FizzBuzz{

  play(number){
    if (this._isDivisibleBy(number, 15)) {
      return 'FizzBuzz'
    }
    else if (this._isDivisibleBy(number, 5)) {
      return 'Buzz';
    }
    else if (this._isDivisibleBy(number, 3)) {
      return 'Fizz'
    } else {
      return number
    }
  };

  _isDivisibleBy(number, division){
    return number % division === 0;
  };
};
