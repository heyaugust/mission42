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

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  context 'safety checks' do

    it 'should raise an error if purchase_type is nil' do
      expect{
        Transaction.create(quantity_purchased: 1, cost_of_purchase: 10)
      }.to raise_error(RuntimeError)
    end

		it 'should raise an error if quantity_purchased is nil' do
      expect{
        Transaction.create(purchase_type: 'team', cost_of_purchase: 10)
      }.to raise_error(RuntimeError)
    end

    it 'should raise an error if cost_of_purchase is nil' do
      expect{
        Transaction.create(purchase_type: 'team', quantity_purchased: '123')
      }.to raise_error(RuntimeError)
    end

  end
end
