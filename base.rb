require 'date'

require './income'
require './expense'
require './remainder'

inc = AbstractIncome.new

inc.add(Date.new(2016, 7, 28), 10_000)
inc.add(Date.new(2016, 8, 28), 10_000)
inc.add(Date.new(2016, 9, 28), 10_000)
inc.add(Date.new(2016, 9, 21), 100_000)

inc.list

exp = AbstractExpense.new

exp.add(Date.new(2016, 7, 30), 10_000)
exp.add(Date.new(2016, 7, 30), 6_000)
exp.add(Date.new(2016, 8, 10), 10_000)
exp.add(Date.new(2016, 8, 20), 70_000)

exp.list

remainder = AbstractRemainder.new(inc.list, exp.list)

remainder.list

remainder.has_debt?


