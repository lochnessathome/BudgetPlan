class RemainderImplementation
  def initialize(income, expense)
    @income = income
    @expense = expense

    @remainder = calc_daily_remainder
  end

  def get(date)
    find_by_date(@remainder, date)
  end

  def list()
    @remainder
  end

  def has_debt?()
    @remainder.any? { |i| i.get_amount < 0 }
  end

  private

  def find_by_date(list, date)
    list.find { |i| i.get_date == date }
  end

  def get_min_date()
    [@income.map(&:get_date) + @expense.map(&:get_date)].flatten.min
  end

  def get_max_date()
    [@income.map(&:get_date) + @expense.map(&:get_date)].flatten.max
  end

  def build_date_sequence()
    (get_min_date..get_max_date).sort
  end

  def calc_daily_balance()
    balance = []

    build_date_sequence.each do |date|
      amount = 0.0
     
      income_invoice = find_by_date(@income, date)
      expense_invoice = find_by_date(@expense, date)

      if income_invoice
        amount += income_invoice.get_amount
      end

      if expense_invoice
        amount -= expense_invoice.get_amount
      end      

      invoice = ::Invoice.new

      invoice.set_date(date)
      invoice.set_amount(amount)

      balance << invoice
    end

    balance
  end

  def calc_daily_remainder()
    balance = calc_daily_balance

    balance.each_with_index do |invoice, ind|
      if ind != 0
        invoice.set_amount(invoice.get_amount + balance[ind - 1].get_amount)
      end
    end

    balance
  end
end

