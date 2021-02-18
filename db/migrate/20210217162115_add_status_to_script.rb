class AddStatusToScript < ActiveRecord::Migration[6.0]
  def change
    add_column :scripts, :status, :string
  end
end
