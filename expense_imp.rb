class ExpenseImplementation
  require './invoice'

  def initialize()
    @invoices = []
  end

  def add(date, amount)
    invoice = find_by_date(date)

    if invoice
      invoice.set_amount(amount)
    else
      invoice = ::Invoice.new
      invoice.set_date(date)
      invoice.set_amount(amount)

      @invoices << invoice
    end
  end

  def edit(date, amount)
    invoice = find_by_date(date)
    return false if !invoice

    invoice.set_amount(amount)
  end

  def remove(date)
    invoice = find_by_date(date)
    return false if !invoice

    @invoices.delete(invoice)
  end

  def list()
    @invoices.sort
  end

  private

  def find_by_date(date)
    @invoices.find { |i| i.get_date == date }
  end
end

