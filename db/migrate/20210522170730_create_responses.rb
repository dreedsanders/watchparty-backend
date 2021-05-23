class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.string :response 
      t.integer :review_id 
      t.integer :user_id 

      t.timestamps
    end
  end
end
