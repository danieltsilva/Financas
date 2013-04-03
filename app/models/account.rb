class Account < ActiveRecord::Base
  attr_accessible :name, :number

  has_many :transactions
  has_many :bill
  has_many :invoice 

def SomaTotalTransacoes
	@somaTransactions = 0
	self.transactions.each do |arrayOfTransactions|
		@somaTransactions+=arrayOfTransactions.amount
	end
	return @somaTransactions
end


#def Soma
#	@somaTransactions= Transaction.all(:select => "transaction.account_id==Account_id, 
#			SUM(transaction.amount) as transaction_total")
#		@somaTransactions.each do |transaction|
# 		transaction.transaction_total
#		end
end