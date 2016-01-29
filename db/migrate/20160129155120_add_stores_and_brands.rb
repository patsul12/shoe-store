class AddStoresAndBrands < ActiveRecord::Migration
  def change
    create_table(:stores) do |s|
      s.string :name
      s.string :description
      s.string :address

      s.timestamps
    end

    create_table(:brands) do |b|
      b.string :name
      b.string :description

      b.timestamps
    end

    create_table(:stores_brands) do |s|
      s.integer :store_id
      s.integer :brand_id
    end
  end
end
