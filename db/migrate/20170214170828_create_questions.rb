class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.string :tags
      t.integer :score

      t.timestamps
    end
  end
end
