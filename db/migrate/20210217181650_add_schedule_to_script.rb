class AddScheduleToScript < ActiveRecord::Migration[6.0]
  def change
    add_column :scripts, :schedule, :datetime
  end
end
