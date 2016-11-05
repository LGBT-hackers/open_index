class AddIndustryToCompany < ActiveRecord::Migration[5.0]
  def change
    add_column :companies, :industry, :string
  end
end
