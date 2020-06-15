class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if self.sender.valid? == true && self.receiver.valid? == true
      true
    end
  end

  def execute_transaction
    if self.sender.valid? == true && self.receiver.valid? == true
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      puts "Transaction rejected. Plese check your account balance."
      self.status = "rejected"
    end
  end

  def reverse_transfer
    self.sender.balance += self.amount
    self.receiver.balance -= self.amount
    self.status = "reversed"
  end

end
