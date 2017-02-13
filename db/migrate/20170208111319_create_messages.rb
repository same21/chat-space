class CreateGroups < ActiveRecord::Migration[5.0]
  def change
     create_table :messages do |t|
      t.text      :body
      t.string    :image
      t.references :users, index: true, foreign_key: true
      t.references :groups, index: true, foreign_key: true
      t.timestamps
    end
  end
end
