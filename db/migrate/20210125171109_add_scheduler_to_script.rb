class AddSchedulerToScript < ActiveRecord::Migration[6.0]
  def change
    add_column :scripts, :scheduler, :time
  end
end
