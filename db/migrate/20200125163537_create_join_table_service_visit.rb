class CreateJoinTableServiceVisit < ActiveRecord::Migration[6.0]
  def change
    create_join_table :services, :visits do |t|
      # t.index [:service_id, :visit_id]
      # t.index [:visit_id, :service_id]
    end
  end
end
