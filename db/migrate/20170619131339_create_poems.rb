class CreatePoems < ActiveRecord::Migration[5.1]
  def change
    create_table :poems do |t|
      t.string :title, null: false
      t.references :author, index: true, foreign_key: true, null: false
      t.text :year, null: false
      t.text :text, null: false
      t.timestamps
    end
  end
end
