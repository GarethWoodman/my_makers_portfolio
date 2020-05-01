# Week 2

## Weekly Goals
1. Break one class into two classes that work together, while maintaining test coverage
2. Unit test classes in isolation using mocking
3. Explain some basic OO principles and tie them to high level concerns (e.g. ease of change)

## Plans to achieve:
1. Learn and implement SRP (Single Response Purpose)
2. Learn how to use double's by following the 'Testing OO Relationships' & 'Dependency Injection' practicals

## Evidence:
### 1. Break one class into two classes that work together, while maintaining test coverage
#### Created programs: bank, calculator & secret diary 
https://github.com/GarethWoodman/my_portfolio/tree/master/week_2/OO%20Principles/Encapsulation_and_Cohesion

### 2. Unit test classes in isolation using mocking
#### Tested a class dependency by using RSPEC's doubles & stubs
https://github.com/GarethWoodman/my_portfolio/tree/master/week_2/testing_relationships_between_classes

### 3. Explain some basic OO principles and tie them to high level concerns (e.g. ease of change)
#### SRP (Single Response Purpose)
To ensure clean and maintainable code, classes & methods should have a single purpose. For example, we could use one Calculator class to calculate a basic sum but we also want to print the sum. This can be seperated into two classes: Calculator to calculate the sum & Answer to print the sum. 

#### Encapsulation
The user is not concerned with what's in our class, they should only care what they get in return for their interaction. The class's methods can ouput instance variables that are suitable for the function called. 

