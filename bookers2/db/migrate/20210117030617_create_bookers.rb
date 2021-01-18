class CreateBookers < ActiveRecord::Migration[5.2]
  def change
    create_table :bookers do |t|
      t.text :title
      t.text :opinion
      t.integer :user_id

      t.timestamps
    end
  end
end
