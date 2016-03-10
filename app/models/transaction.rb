# == Schema Information
#
# Table name: transactions
#
#  id                 :integer          not null, primary key
#  purchase_type      :string
#  quantity_purchased :integer
#  cost_of_purchase   :decimal(2, )
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Transaction < ActiveRecord::Base
	before_save :check_validity

	private
	  def check_validity
	    raise 'purchase_type should not be nil' if self.purchase_type.nil?
	    raise 'quantity_purchased should not be nil' if self.quantity_purchased.nil?
	    raise 'cost_of_purchase should not be nil' if self.cost_of_purchase.nil?
	  end
end
