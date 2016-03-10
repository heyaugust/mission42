# == Schema Information
#
# Table name: race_packages
#
#  id               :integer          not null, primary key
#  race_id          :string
#  price            :decimal(2, )
#  discounted_price :decimal(2, )
#  quantity         :integer
#  description      :text
#  early_bird_quota :integer
#  quantity_sold    :integer
#  campaign_id      :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class RacePackage < ActiveRecord::Base
  belongs_to :user

  before_save :check_validity

  def get_pricing
    # if early bird quota not met, return early bird pricing
    if early_bird_quota > quantity_sold
      return discounted_price
    else
      return price
    end
    # add code here to calculate early bird pricing.

    # 
  end



  private
  def check_validity
    raise 'quantity should not be nil' if self.quantity.nil?
    raise 'Exceeded race package quantity. all sold out' if self.quantity_sold > self.quantity
    raise 'Exceeded early bird quantity. all sold out' if self.early_bird_quota > self.quantity
    raise 'campaign_id should not be nil' if self.campaign_id.nil?
    raise 'description should not be nil' if self.description.nil?
    raise 'price should not be nil' if self.price.nil?
    raise 'Price should be more than discounted_price' if price <= discounted_price
  end
end
