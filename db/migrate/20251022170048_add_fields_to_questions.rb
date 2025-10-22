class AddFieldsToQuestions < ActiveRecord::Migration[8.0]
  def change
    add_column :questions, :item_code, :string unless column_exists?(:questions, :item_code)
    add_column :questions, :response_type, :string unless column_exists?(:questions, :response_type)
    add_column :questions, :options, :text unless column_exists?(:questions, :options)

    # scale_id yoksa ilişkiyi garantiye al
    add_reference :questions, :scale, foreign_key: true unless column_exists?(:questions, :scale_id)
  end
end
