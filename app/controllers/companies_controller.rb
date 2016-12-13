class CompaniesController < ApplicationController
  include CompaniesHelper
  before_filter(only: [:index]) { |c| c.nav_search_render(false) }
  before_filter(except: [:index]) { |c| c.nav_search_render(true) }

  def index
    @company = Company.new
    @searched_term = params[:name]
    if search_contains_characters(params)
      @companies =  Company.where('lower(name) LIKE ?', "%#{@searched_term}%".downcase).all.order(:name)
      @api_companies = []
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

  def new
    if params["api"]
      company_create
    end
    @company = Company.new
  end

  def create
    company_create
  end

  def edit
    @company = Company.find(params[:id])
  end

  def update
    @company = Company.find(params[:id])
    @company.update(company_params)
    redirect_to company_path
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
    @name = @company.name
    redirect_to '/companies'
  end

  private

  def company_create
    company = Company.new(company_params)
    if company.save
      success_redirect(company[:name], company[:id])
    else
      fail_redirect(company)
    end
  end
end
