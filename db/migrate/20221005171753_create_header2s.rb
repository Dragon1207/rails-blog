class CreateHeader2s < ActiveRecord::Migration[7.0]
  def change
    create_table :header2s do |t|
      t.string :description

      t.timestamps
    end
  end
end
