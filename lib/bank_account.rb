class BankAccount
  attr_reader(:name)
  attr_accessor(:status,:balance)
  # code here
  def initialize(name)
    @name = name
    @status = "open"
    @balance = 1000
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your Balance is $#{@balance}."
  end

  def valid?
    if @balance == 0 || @status == "closed"
      return false
    else
      return true
    end
  end

  def close_account
    @status = "closed"
  end

end