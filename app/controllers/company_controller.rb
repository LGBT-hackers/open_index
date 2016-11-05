class CompanyController < ApplicationController
  include CompanyHelper
  def index
    @searched_term = params[:name]
    if search_contains_characters(params)
      @companies =  Company.where('lower(name) LIKE ?', "%#{@searched_term}%".downcase).all.order(:name)
      if @companies.count == 0
        "http://api.glassdoor.com/api/api.htm?t.p=#{ENV["GD_ID"]}&t.k=#{ENV["GD_KEY"]}&userip=0.0.0.0&useragent=&format=json&v=1&action=employers&q=#{@searched_term}"
      end
    else
      @companies = Company.all.order(:name
    end
    @company_names = get_unique(@companies)
  end
end
