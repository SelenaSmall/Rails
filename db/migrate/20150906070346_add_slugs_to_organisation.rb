class AddSlugsToOrganisation < ActiveRecord::Migration
  def change
  	add_column :organisations, :slug, :text
  	add_index :organisations, :slug
  end
end
