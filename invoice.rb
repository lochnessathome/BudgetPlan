class Invoice
  include Comparable

  def initialize()
    @date = nil
    @amount = nil
  end

  def get_date()
    @date
  end

  def get_amount()
    @amount
  end

  def set_date(date)
    @date = date
  end

  def set_amount(amount)
    @amount = amount
  end

  def <=>(other)
    get_date <=> other.get_date
  end

  def inspect()
    "<Invoice date = #{get_human_date}, amount = #{get_human_amount}>"
  end

  private

  def get_human_date()
    get_date.iso8601
  end

  def get_human_amount()
    get_amount.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
  end
end

