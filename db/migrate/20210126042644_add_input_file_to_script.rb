class AddInputFileToScript < ActiveRecord::Migration[6.0]
  def change
    add_column :scripts, :input_file, :string
  end
end
