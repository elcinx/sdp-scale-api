class AddFieldsToScales < ActiveRecord::Migration[7.2]
  def change
    add_column :scales, :domain, :string
    add_column :scales, :version, :string
    add_column :scales, :sdp_doi, :string
    add_column :scales, :status, :string
  end
end
