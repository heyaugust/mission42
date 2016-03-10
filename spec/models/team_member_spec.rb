# == Schema Information
#
# Table name: team_members
#
#  id                :integer          not null, primary key
#  team_leader_id    :string
#  team_member_email :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe TeamMember, type: :model do

  context 'safety checks' do

    it 'should raise an error if team_leader_id is nil' do
      expect{
        TeamMember.create(team_member_email: 'xx@xx.cm')
      }.to raise_error(RuntimeError)
    end

    it 'should raise an error if team_member_email is nil' do
      expect{
        TeamMember.create(team_leader_id: '123')
      }.to raise_error(RuntimeError)
    end

  end

  context 'Business logic' do

  	it 'should have x-1 team members in the team where x is the number of members' do
  		
  	end

  end
end
