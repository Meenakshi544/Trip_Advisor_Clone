class CreateUsercomments < ActiveRecord::Migration[7.0]
  def change
    create_table :usercomments do |t|
      t.text :body
      t.references :review, null: false, foreign_key: true

      t.timestamps
    end
  end
end
