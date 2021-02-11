class CreateNetflixes < ActiveRecord::Migration[6.1]
  def change
    create_table :netflixes do |t|
      t.string :title
      t.string :synopsis
      t.string :vtype
      t.string :image
      t.integer :year
      t.string :genre
      t.integer :rating
      t.string :imdbrated

      t.timestamps
    end
  end
end
