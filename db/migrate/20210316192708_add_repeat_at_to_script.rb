class AddRepeatAtToScript < ActiveRecord::Migration[6.0]
  def change
    add_column :scripts, :repeat_at, :integer
  end
end
