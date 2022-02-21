class CreateFlats < ActiveRecord::Migration[6.1]
  def change
    create_table :flats do |t|
      t.string :title,
      t.string :address,
      t.string :dates,
      t.integer, :price
      t.string :description

      t.timestamps
    end
  end
end
