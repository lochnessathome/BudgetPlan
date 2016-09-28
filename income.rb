class AbstractIncome
  require './income_imp'

  def initialize()
    @imp = IncomeImplementation.new
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

