class CreateSurveys < ActiveRecord::Migration[8.0]
  def change
    create_table :surveys do |t|
      t.string   :title
      t.string   :status
      t.string   :distribution_mode
      t.datetime :start_at
      t.datetime :end_at
      t.references :scale, null: false, foreign_key: true
      t.references :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
