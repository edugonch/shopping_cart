# Sales Tax Problem

## Description

This project provides a solution to the sales tax problem, where a list of items is given and the total cost and sales tax should be calculated based on the given rules. The rules for calculating sales tax are as follows:

- Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products.
- Import duty is applicable on all imported goods at a rate of 5%, with no exceptions.
- The total tax amount for an item should be rounded up to the nearest 0.05.

The solution is implemented in Ruby and provides a `ShoppingCart` class that can be used to add items to the cart and generate a receipt that shows the cost and sales tax for each item, as well as the total cost and sales tax for the entire cart.

## Installation and Usage

To use this solution, you'll need to have Ruby installed on your system. Once you have Ruby installed, follow these steps:

1. Clone this repository to your local machine.
2. Open a terminal or command prompt and navigate to the root directory of the project.
3. Run the `app.rb` file with the command `ruby app.rb`.
4. Enter the list of items in the format `quantity name at price`, one item per line.
5. Press `Enter` twice to generate a receipt.

For example, to calculate the cost and sales tax for the items listed in the first example of the problem, you would enter the following input:
1 book at 12.49
1 music CD at 14.99
1 chocolate bar at 0.85

The program would then output the following receipt:
1 book: 12.49
1 music CD: 16.49
1 chocolate bar: 0.85
Sales Taxes: 1.50
Total: 29.83

## Testing

The solution includes a set of RSpec tests to ensure that the `ShoppingCart` class behaves correctly. To run the tests, follow these steps:

1. Make sure that RSpec is installed by running the command `bundle install` in your terminal or command prompt.
2. Navigate to the root directory of the project.
3. Run the command `rspec` to run all of the tests.
