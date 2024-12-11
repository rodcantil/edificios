class CreateJoinTableFeatureBuilding < ActiveRecord::Migration[8.0]
  def change
    create_join_table :features, :buildings do |t|
      # t.index [:feature_id, :building_id]
      # t.index [:building_id, :feature_id]
    end
  end
end
