class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.references :type, null: false, foreign_key: true
      t.string :name
      t.decimal :price
      t.string :note
      t.datetime :datetime

      t.timestamps
    end
  end
end
