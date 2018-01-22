class AddColumnInterviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :interviews, :recipient, foreign_key: { to_table: :users }
  end
end
