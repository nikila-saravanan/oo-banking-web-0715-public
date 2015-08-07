class Transfer
  # code here
  attr_reader(:sender,:receiver)
  attr_accessor(:status,:amount)

  def initialize(sender,receiver,amount=50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @status != "complete"
      if @amount > sender.balance
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
        sender.balance -= @amount
        receiver.balance += amount
        @status = "complete"
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end 
  end

end