class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :searchTerm
      t.integer :numberOfSearches

      t.timestamps
    end
  end
end
