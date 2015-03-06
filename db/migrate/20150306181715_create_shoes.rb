class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
     t.references :brand, index: true
     t.references :store, index: true
    end
  end
end
