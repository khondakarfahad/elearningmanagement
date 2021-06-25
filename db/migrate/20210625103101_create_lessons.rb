class CreateLessons < ActiveRecord::Migration[6.1]
  def change
    create_table :lessons do |t|
      t.belongs_to :course, foreign_key: true, null: false
      t.column :questions, :json
      t.timestamps
    end
  end
end
