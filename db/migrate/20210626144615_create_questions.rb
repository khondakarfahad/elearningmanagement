class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.belongs_to :lesson, foreign_key: true, null: false
      t.string :name, null: false
      t.column :options, :jsonb, null: false
      t.string :answer, null: false
      t.timestamps
    end
  end
end
