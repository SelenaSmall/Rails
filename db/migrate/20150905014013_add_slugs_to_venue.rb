class AddSlugsToVenue < ActiveRecord::Migration
  def change
  	add_column :venues, :slug, :text
  	add_index :venues, :slug
  end
end
