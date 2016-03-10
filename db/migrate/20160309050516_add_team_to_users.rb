class AddTeamToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :team, :integer, index: true
  end
end
