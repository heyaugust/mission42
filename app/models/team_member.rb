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

class TeamMember < ActiveRecord::Base
	belongs_to :user
		
  before_save :check_validity

	def create
	end

	private
	  def check_validity
	    raise 'team_leader_id should not be nil' if self.team_leader_id.nil?
	    raise 'team_member_email should not be nil' if self.team_member_email.nil?
	  end
end
