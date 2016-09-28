class AbstractRemainder
  require './remainder_imp'

  def initialize(income, expense)
    @imp = RemainderImplementation.new(income, expense)
  end

  def get(date)
    @imp.get(date)
  end

  def list()
    @imp.list
  end

  def has_debt?()
    @imp.has_debt?
  end
end

