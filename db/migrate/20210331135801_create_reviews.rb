class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :name,    null: false                    
      t.string :group,   null: false                    
      t.string :proceeds,null: false                   
      t.text :comment,   null: false          
      t.references :user, foreign_key: true 
      t.references :room, foreign_key: true 
      t.timestamps
    end
  end
end
