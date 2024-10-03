class CreateResults < ActiveRecord::Migration[7.2]
  def change
    create_table :results do |t|
      t.references :session, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :submitted_at

      t.timestamps
    end
  end
end
