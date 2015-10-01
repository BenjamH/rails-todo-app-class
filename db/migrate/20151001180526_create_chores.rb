class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :name
      t.boolean :completed, default: false

      t.timestamps null: false
    end
  end
end
