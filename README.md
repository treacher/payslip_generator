# Payslip Generator

## Running the application

`./bin/generate-payslips <path-to-employee-data> <output-path-for-payslips>`

## Running the tests

`bundle exec rake`

## Building tax bracket yaml files

Example:

```YAML
- multiplier: 0.0
  min: 0
  max: 18200
- multiplier: 0.19
  min: 18201
  max: 37000
- multiplier: 0.325
  min: 37001
  max: 80000
- multiplier: 0.37
  min: 80001
  max: 180000
- multiplier: 0.45
  min: 180001
  max: -1
```

Max of `-1` is the equivilant of infinite.

## Design decisions

#### Tax Bracket

The Tax Bracket object takes a range and a multiplier, the idea behind this is
that for a given tax system you will need to create multiple tax brackets and
then apply them to a TaxCalculator, this provides the ability to support
multiple tax systems.

#### Tax Calculator

This is essentially a pretty simple object that takes a salary and an array of
tax brackets and sums all the tax bracket calculations and rounds accordingly.

#### Payslip Factory

Initially I was going to have all the calculations as seperate classes but I felt
the calculations were too simple to have in a single class as often they're just
basic math operations.

The class only calculates monthly payslips, it doesn't support partial months,
this is to keep the first implementation simple. If I was to implement this I would
inject an object which calculates a multiplier based on a date range.

#### Payslip Writers

At the moment the only implementation supported is writing to CSV but I've
implemented it so that you could inject any writer in that responds to `<<` and
`close`. This overiddes `<<` from the CSV library and converts the payslip to CSV format.

#### Employee Readers
At the moment the only implementation supported is writing to CSV but I've
implemented it so that you could inject any reader in that responds to `each`.
This overiddes `each` from the CSV library and converts the row into the
generic payslip format.

## Assumptions made
- Majority of tax calculations are performed using some form of bracket system.
  This assumption is based on information collected from the UK, Germany,
  Australia and New Zealand tax system.
- Pay periods aren't taken into consideration when it comes to calculating the
  monthly pay, so this solution doesn't cater for partial months only for
  full months.
- CSV file will not have headers in it.
- CSV file will always be provided in the correct format

## Future improvements
- Add more tax bracket configuration files and add country code as an arguement for the `generate-payslips` script
- Make the CSV Reader a little smarter in regards to format checking.
