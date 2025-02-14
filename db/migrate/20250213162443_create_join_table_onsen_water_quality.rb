class CreateJoinTableOnsenWaterQuality < ActiveRecord::Migration[7.0]
  def change
    create_join_table :onsens, :water_qualities do |t|
      t.index :onsen_id
      t.index :water_quality_id
    end
  end
end
