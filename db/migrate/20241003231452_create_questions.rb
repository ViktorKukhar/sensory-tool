class CreateQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :questions do |t|
      t.string :label
      t.string :input_type
      t.jsonb :options
      t.references :template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
