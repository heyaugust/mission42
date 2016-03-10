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

require 'rails_helper'

RSpec.describe RacePackage, type: :model do

  context 'safety checks' do

    it 'should raise an error if quantity is nil' do
      expect{
        RacePackage.create(race_id: '123')
      }.to raise_error(RuntimeError)
    end

    it 'should raise an error if quantity_sold > quantity' do
      expect{
        RacePackage.create(race_id: '123', quantity: 10, quantity_sold: 11)
      }.to raise_error(RuntimeError)
    end

    it 'should save to database properly' do
      RacePackage.create(race_id: '123', quantity: 10, quantity_sold: 0, early_bird_quota: 6, description: '5K race', campaign_id: 1, discounted_price: 20, price: 30)
      package = RacePackage.last
      expect(package.description).to eq('5K race')
    end
    
    it 'should raise an error if early_bird_quota > quantity' do
      expect{
        RacePackage.create(race_id: '123', quantity_sold: 0, quantity: 10, early_bird_quota: 11, description: '5k race', campaign_id: 1, price: 30)
      }.to raise_error(RuntimeError)
    end

    it 'should have a campaign_id' do
      expect{
        RacePackage.create(race_id: '123', quantity_sold: 0, quantity: 10, early_bird_quota: 11, description: '5k race', price: 30)
      }.to raise_error(RuntimeError)
    end

    it 'should have a description' do
      expect{
        RacePackage.create(race_id: '123', quantity_sold: 0, quantity: 10, early_bird_quota: 11, campaign_id: 1, price: 30)
      }.to raise_error(RuntimeError)
    end

    it 'should raise an error if discounted_price > price' do
      expect{
        RacePackage.create(race_id: '123', quantity: 10, quantity_sold: 0, early_bird_quota: 6, description: '5K race', campaign_id: 1, discounted_price: 40, price: 30)
      }.to raise_error(RuntimeError)
    end

    it 'should have a price' do
      expect{
        RacePackage.create(race_id: '123', quantity_sold: 0, quantity: 10, early_bird_quota: 11, campaign_id: 1, description: '5k race')
      }.to raise_error(RuntimeError)
    end

  end

  context 'Business logic' do
  
    it 'should show discounted price if early bird quota has not been met' do
      package = RacePackage.create(race_id: '123', quantity: 10, quantity_sold: 0, early_bird_quota: 6, description: '5K race', campaign_id: 1, discounted_price: 20, price: 30)
      expect(package.get_pricing).to eq(20)
      package.quantity_sold = 6
      package.save!
      package.reload
      expect(package.get_pricing).to eq(30)
      package.quantity_sold = 7
      package.save!
      package.reload
      expect(package.get_pricing).to eq(30)
    end

    it 'quantity_sold should increase after sales' do
      package = RacePackage.create(race_id: '123', quantity: 10, quantity_sold: 0, early_bird_quota: 6, description: '5K race', campaign_id: 1, discounted_price: 20, price: 30)
      expect(package.quantity_sold).to eq(0)
      package.quantity_sold += 1
      package.save!
      package.reload
      expect(package.quantity_sold).to eq(1)
    end
  end


end
