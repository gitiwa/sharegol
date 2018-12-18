class CreateWents < ActiveRecord::Migration[5.0]
  def change
    create_table :wents do |t|
      t.string :type
      t.references :user, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :course_id , :type], unique: true
    end
  end
end
