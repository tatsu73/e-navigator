class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|

      t.references :users, foreign_key: true
      t.datetime :reservation_date
      t.integer :status, default: 0, null: false, limit: 1
      t.timestamps
    end
  end
end
