class AddNameToGalleries < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :name, :string
  end
end
