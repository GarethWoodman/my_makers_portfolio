describe('FizzBuzz', function() {

  var fizzBuzz;

  beforeEach(function() {
    fizzBuzz = new FizzBuzz();
  });

  describe('multiples of 3', function() {
    it('fizzes for 3', function() {
      expect(fizzBuzz.play(3)).toEqual('Fizz');
    });
  });

  describe('multiples of 5', function() {
    it('fizzes for 5', function() {
      expect(fizzBuzz.play(5)).toEqual('Buzz');
    });
  });

  describe('multiples of 3 & 5', function() {
    it('FizzBuzz for 15', function() {
      expect(fizzBuzz.play(15)).toEqual('FizzBuzz');
    });
  });

  describe('puts numbers that isnt multiple of 3 or 5', function() {
    it('Returns number', function() {
      expect(fizzBuzz.play(8)).toEqual(8);
    });
  });
});
