class CreateTypewords < ActiveRecord::Migration[7.0]
  def change
    create_table :typewords do |t|
      t.string :typeword

      t.timestamps
    end
  end
end
