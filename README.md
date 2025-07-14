# Sales Tax Calculator

A Ruby application that calculates sales tax and generates receipts for shopping baskets. This project demonstrates object-oriented design principles and clean code practices. The challenge and its rules can be found [here](challenge.md).

*Note:* This is the finished project, forked from [this repo](https://github.com/mocha06/sales_tax_calculator), which I also created, but since I was on a time limit of 4 hours, I was unable to finish. To preserve the state of the application at the 4 hour mark, I decided to create a new repo and finish the challenge. 

## Requirements

- **Ruby 3.0+** (developed with Ruby 3.2.2)
- **RSpec** for testing

## Installation

1. **Clone the repository:**
   ```bash
   git clone git@github.com:mocha06/sales_tax_calculator_v2.git
   cd sales_tax_calculator_v2
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
sales-tax-calculator/
├── lib/
│   ├── item.rb                    # Item class - represents a single product
│   ├── tax_calculator.rb          # Tax calculation logic
│   ├── tax_exemption_checker.rb   # Determines tax-exempt items
│   ├── receipt.rb                 # Receipt generation and formatting
│   ├── input_parser.rb            # Parses input strings into Item objects
│   └── main.rb                    # Main application entry point
├── spec/
│   ├── item_spec.rb               # Tests for Item class
│   ├── tax_calculator_spec.rb     # Tests for TaxCalculator
│   ├── receipt_spec.rb            # Tests for Receipt class
│   └── input_parser_spec.rb       # Tests for InputParser
├── .rspec                         # RSpec configuration
├── challenge.md                   # Original challenge requirements
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

## Usage

### Command Line Interface

The application supports three modes:

- **Default (Challenge Examples):**
  ```bash
  ruby lib/main.rb
  ```
  This will print the receipts for the three challenge examples.

- **Interactive Mode:**
  ```bash
  ruby lib/main.rb --interactive
  ```
  Enter items one at a time. Type `done` to finish and print the receipt.

- **Bulk Mode:**
  ```bash
  ruby lib/main.rb --bulk
  ```
  Paste or type multiple items (one per line). Enter an empty line to finish and print the receipt.

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

## TODO

This isn't really what should go on a ReadMe, but since I'm probably not going to touch this project anymore, here are some footnotes of potential improvements and to-dos:

### Current TODOs in Code
- **Receipt class**: Refactor to use `ReceiptCalculator` service for tax calculations
- **Receipt class**: Refactor to use `ReceiptFormatter` service for output formatting
- **InputParser**: Implement parsing logic for CLI input (currently supports single and bulk line input)
- **Main application**: Further modularize CLI logic if the app grows

### Implementation Status
- ✅ **Item class** - Complete with tax exemption detection
- ✅ **TaxCalculator** - Complete with proper rounding
- ✅ **TaxExemptionChecker** - Complete with keyword matching
- ✅ **Receipt class** - Complete and working
- ✅ **InputParser** - Complete for current requirements
- ✅ **CLI Interface** - Complete for current requirements
- ✅ **Main application** - Complete for current requirements

### Next Steps
1. Refactor Receipt class to use separate services (if needed)
2. Add more robust input validation and error handling
3. Add support for different tax rates or currencies
4. Add file input/output capabilities
5. Add a web interface or API
6. Integrate with a database for item catalog

