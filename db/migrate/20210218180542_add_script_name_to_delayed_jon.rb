class AddScriptNameToDelayedJon < ActiveRecord::Migration[6.0]
  def change
    add_column :delayed_jobs, :script_name, :string
  end
end
