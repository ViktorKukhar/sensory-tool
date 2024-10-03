class CreateAnswers < ActiveRecord::Migration[7.2]
  def change
    create_table :answers do |t|
      t.string :answer_value
      t.references :question, null: false, foreign_key: true
      t.references :tester, null: false, foreign_key: { to_table: :users }
      t.references :session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
