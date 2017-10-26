class CreateLogFileUtilities < ActiveRecord::Migration[5.0]
  def change
    create_table :log_file_utilities do |t|
      t.string :directory

      t.timestamps
    end
  end
end
