class CreateValidationReports < ActiveRecord::Migration[8.0]
  def change
    create_table :validation_reports do |t|
      t.float :reliability
      t.text :notes
      t.references :scale, null: false, foreign_key: true

      t.timestamps
    end
  end
end
