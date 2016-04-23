class CreateLunchRouletteGroups < ActiveRecord::Migration
  def change
    create_table :lunch_roulette_groups do |t|

      t.timestamps null: false
    end
  end
end
