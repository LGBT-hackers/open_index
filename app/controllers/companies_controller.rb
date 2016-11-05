class CompaniesController < ApplicationController
  include CompaniesHelper
  def index
    @searched_term = params[:name]
    if search_contains_characters(params)
      @companies =  Company.where('lower(name) LIKE ?', "%#{@searched_term}%".downcase).all.order(:name)
      if @companies.count == 0
         @api_companies = HTTParty.get("http://api.glassdoor.com/api/api.htm?t.p=#{ENV["GD_ID"]}&t.k=#{ENV["GD_KEY"]}&userip=0.0.0.0&useragent=&format=json&v=1&action=employers&q=#{@searched_term}")["response"]["employers"]
      end
    else
      @companies = Company.all
    end
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    company = Company.new(company_params)
    if company.save
      success_redirect(company[:name], company[:id])
    else
      fail_redirect(company)
    end
  end

  def edit
    company = Company.find(params[:id])
  end

  def update
    company = Company.find(params[:id])
    company.update(company_params)
    redirect_to company_path
  end

  def destroy
    company = Company.find(params[:id])
    @name = company.name
  end
end
