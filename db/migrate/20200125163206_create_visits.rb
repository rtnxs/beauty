class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.references :client, null: false, foreign_key: true
      t.datetime :datetime
      t.decimal :visit_price
      t.string :note

      t.timestamps
    end
  end
end
