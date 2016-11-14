# Payslip Generator


## Design decisions

#### Tax Bracket

The Tax Bracket object takes a range and a multiplier, the idea behind this is
that for a given tax system you will need to create multiple tax brackets and
then apply them to a TaxCalculator, this provides the ability to support
multiple tax systems. This could become configuration for example having
`config/tax_brackets/nz.yml` this will then create the appropriate tax brackets
for the given tax system,

#### Tax Calculator

This is essentially a pretty simple object that takes a salary and an array of
tax brackets and sums all the tax bracket calculations and rounds accordingly.

## Assumptions made
- Majority of tax calculations are performed using some form of bracket system.
  This assumption is based on information collected from the UK, Germany,
  Australia and New Zealand tax system.
- Pay periods aren't taken into consideration when it comes to calculating the
  monthly pay, so this solution doesn't cater for partial months only for
  full months.
