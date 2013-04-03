class Bill < ActiveRecord::Base
  belongs_to :account
  belongs_to :category
  attr_accessible :amount, :number, :paid, :payment_date, :payment_method, :account_id, :category_id, :approved
end
