class CreateDealsGroupsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :deals, :groups
  end
end
