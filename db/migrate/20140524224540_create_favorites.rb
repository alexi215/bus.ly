class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string  "user_id"
      t.text    "wmata_url"
    end
  end
end
