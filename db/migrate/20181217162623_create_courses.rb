class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :code
      t.string :name
      t.string :detail_url
      t.string :course_image_url
      t.string :address
      t.string :caption
      t.float :evaluation

      t.timestamps
    end
  end
end
