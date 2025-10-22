class AddTextToQuestions < ActiveRecord::Migration[8.0]
  def change
    add_column :questions, :text, :text unless column_exists?(:questions, :text)
  end
end
