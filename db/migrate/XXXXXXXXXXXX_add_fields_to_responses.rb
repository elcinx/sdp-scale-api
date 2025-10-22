class AddFieldsToResponses < ActiveRecord::Migration[8.0]
  def change
    add_column    :responses, :submitted_at,  :datetime unless column_exists?(:responses, :submitted_at)
    add_column    :responses, :respondent_id, :integer  unless column_exists?(:responses, :respondent_id)
    add_column    :responses, :meta,          :text     unless column_exists?(:responses, :meta)
    add_reference :responses, :survey, null: false, foreign_key: true unless column_exists?(:responses, :survey_id)
  end
end
