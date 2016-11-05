class CompanyController < ApplicationController
  include CompanyHelper
  def index
    @searched_term = params[:name]
    if search_contains_characters(params)
      @companies =  Company.where('lower(name) LIKE ?', "%#{@searched_term}%".downcase).all.order(:name)
    else
      @companies = Company.all.order(:name)
    end
    @company_names = get_unique(@companies)
  end
end
