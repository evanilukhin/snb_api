class CreateBearers < ActiveRecord::Migration[7.0]
  def change
    create_table :bearers do |t|
      t.string :name, unique: true

      t.timestamps
    end
    add_index :bearers, :name
  end
end
