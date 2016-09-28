class AbstractExpense
 require './expense_imp'

  def initialize()
    @imp = ExpenseImplementation.new
  end

  def add(date, amount)
    @imp.add(date, amount)
  end

  def edit(date, amount)
    @imp.edit(date, amount)
  end

  def remove(date)
    @imp.remove(date)
  end

  def list()
    @imp.list
  end
end

