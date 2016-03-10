class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :team_leader_id
      t.string :team_member_email

      t.timestamps null: false
    end
  end
end
