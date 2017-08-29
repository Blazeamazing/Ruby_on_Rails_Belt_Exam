class CreateWarriors < ActiveRecord::Migration
  def change
    create_table :warriors do |t|
      t.references :user, index: true, foreign_key: true
      t.references :formation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
