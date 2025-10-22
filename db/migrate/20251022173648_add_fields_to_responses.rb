class AddFieldsToResponses < ActiveRecord::Migration[8.0]
  def change
    add_column :responses, :submitted_at, :datetime
    add_column :responses, :respondent_id, :integer
    add_column :responses, :meta, :text
    add_reference :responses, :survey, null: false, foreign_key: true
  end
end
