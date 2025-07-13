# Sales Tax Calculator

A Ruby application that calculates sales tax and generates receipts for shopping baskets. This (unfinished) project demonstrates object-oriented design principles and clean code practices. The challenge and it's rules can be found [here](challenge.md). 

## Requirements

- **Ruby 3.0+** (developed with Ruby 3.2.2)
- **RSpec** for testing

## Installation

1. **Clone the repository:**
   ```bash
   git clone git@github.com:mocha06/sales_tax_calculator.git
   cd subscribe_assignment
   ```

2. **Install RSpec (if not already installed):**
   ```bash
   gem install rspec
   ```

3. **Initialize RSpec (if not already done):**
   ```bash
   rspec --init
   ```

## Project Structure

```
subscribe_assignment/
├── lib/
│   ├── item.rb                    # Item class - represents a single product
│   ├── tax_calculator.rb          # Tax calculation logic
│   ├── tax_exemption_checker.rb   # Determines tax-exempt items
│   ├── receipt.rb                 # Receipt generation and formatting
│   └── input_parser.rb            # Parses input strings into Item objects
├── spec/
│   ├── item_spec.rb               # Tests for Item class
│   ├── tax_calculator_spec.rb     # Tests for TaxCalculator
│   ├── receipt_spec.rb            # Tests for Receipt class
│   └── input_parser_spec.rb       # Tests for InputParser
├── .rspec                         # RSpec configuration
└── README.md                      # This file
```

## Running Tests

### Run all tests:
```bash
rspec
```

### Run specific test suites:
```bash
# Run only Item tests
rspec spec/item_spec.rb

# Run only TaxCalculator tests
rspec spec/tax_calculator_spec.rb

# Run only Receipt tests
rspec spec/receipt_spec.rb

# Run only InputParser tests
rspec spec/input_parser_spec.rb
```

### Run tests with detailed output:
```bash
rspec --format documentation
```

### Run tests with coverage (if using SimpleCov):
```bash
rspec --format documentation --color
```

## Usage

Unfortunately due to time constraints, the main application was not implemented. You can see the missing To-Dos [here](#todo)

### Command Line Interface

The application it's finished state was meant to support CLI input for individual items:

```bash
ruby main.rb
```

**Input Format:**
```
quantity item_name at price
```

**Examples:**
```
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
```

**Output:**
```
2 book: 24.98
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 42.32
```

## Business Rules

### Tax Calculation
- **Basic Sales Tax**: 10% on all goods except books, food, and medical products
- **Import Duty**: 5% on all imported goods (no exceptions)
- **Rounding**: Tax amounts are rounded up to the nearest 0.05

### Tax-Exempt Items
Items containing these keywords are exempt from basic sales tax:
- `book` (books)
- `chocolate` (food items)
- `pills` (medical products)

### Imported Items
Items containing the word "imported" (case-insensitive) are subject to import duty.

## Design Principles

This project demonstrates:
- **Single Responsibility Principle** - Each class has one clear purpose
- **Composition over Inheritance** - Classes work together through composition
- **Clean Code** - Readable, maintainable, and well-tested code
- **Test-Driven Development** - Comprehensive test coverage

## Example Scenarios

### Input 1:
```
2 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85
```

### Input 2:
```
1 imported box of chocolates at 10.00
1 imported bottle of perfume at 47.50
```

### Input 3:
```
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
3 imported boxes of chocolates at 11.25
```

## Development

### Adding New Features
1. Write tests
2. Implement the feature
3. Ensure all tests pass
4. Refactor if needed

### Code Style
- Follow Ruby conventions
- Use meaningful variable and method names
- Add comments for complex business logic
- Keep methods small and focused

## Assumptions

1. **Input Validation**: The application assumes valid input format
2. **Currency**: All prices are in the same currency unit
3. **Tax Rates**: Fixed rates as specified in business rules
4. **Rounding**: Always rounds up to nearest 0.05

## TODO

### Current TODOs in Code
- **Receipt class**: Refactor to use `ReceiptCalculator` service for tax calculations
- **Receipt class**: Refactor to use `ReceiptFormatter` service for output formatting
- **InputParser**: Implement parsing logic for CLI input
- **Main application**: Create CLI interface (`main.rb`)

### Implementation Status
- ✅ **Item class** - Complete with tax exemption detection
- ✅ **TaxCalculator** - Complete with proper rounding
- ✅ **TaxExemptionChecker** - Complete with keyword matching
- ✅ **Receipt class** - Basic implementation working, needs refactoring
- ❌ **InputParser** - Started, but not completed
- ❌ **CLI Interface** - Not yet implemented
- ❌ **Main application** - Not yet implemented

### Next Steps
1. Implement `InputParser` class
2. Create CLI interface in `main.rb`
3. Test full application with challenge examples
4. Refactor Receipt class to use separate services (if time permits)


### Notes

#### Time
Total time for the project in it's current state was 4 hours
start time:

[start_time](extra/start%20time.jpeg)

I first did 02h21m of work (calculation [here](https://www.calculator.net/time-duration-calculator.html?starthour=04&startmin=46&startsec=0&startunit=p&endhour=07&endmin=07&endsec=0&endunit=p&ctype=1&x=Calculate)). 

first break can be seen in [this commit](https://github.com/mocha06/sales_tax_calculator/pull/4). As I mentioned in the comment, I stopped at 19:07, and restarted at 13:00 on the following day (jul 12, 2025)

I stopped writing this README at around 15:25, totalling around 4 hours.


#### AI Usage
I limited my usage of AI to be writing help write the README, looking up some methods, and finish writing the tests in `spec/input_parser_spec.rb` (my time was running out so I just wanted to finish them before starting the readme). This is how I would normally operate and I wanted it to be as organic as possible, so on the reviewer's side: they'll get an idea of my work, and on my side: I get to code an interesting challenge. If I were to use AI to code this whole challenge, it'd probably take me less than 15 minutes to have a working prototype.

I firmly believe that: without the usage of AI, this challenge is not possible to finish within 4 hours. I may be wrong, but I worked pretty fast and didn't make that many mistakes, and I still couldn't finish it.

Of course I'd use more AI in day-to-day work, and of course I'd obviously move faster. But I believe that's not what this challenge was about (Again, I might be wrong).


#### Final notes

I'd like to finish this project, so I'll create a new repo with this project in it's current state, and will evolve it so that it's actually finished. I'll probably take around 3-4 more hours if I don't use AI.

THANK YOU!

