class CreateResponses < ActiveRecord::Migration[8.0]
  def change
    create_table :responses do |t|
      t.text :answer
      t.datetime :submitted_at
      t.integer :respondent_id
      t.text :meta
      t.references :question, null: false, foreign_key: true
      t.references :survey, null: false, foreign_key: true   # <-- ekledik
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  en
