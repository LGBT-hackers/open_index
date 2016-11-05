class CompaniesController < ApplicationController
  include CompaniesHelper
  def index
    @searched_term = params[:name]
    if search_contains_characters(params)
      @companies =  Company.where('lower(name) LIKE ?', "%#{@searched_term}%".downcase).all.order(:name)
    else
      @companies = Company.all.order(:name)
    end
    @company_names = get_unique(@companies)
  end

  def show
    @company = Company.find(params[:id])
  end

  def create
    company = Company.new(company_params)
    # company.user_id = current_user.id
    if company.save
      success_redirect(company[:name])
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
