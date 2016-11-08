class ReviewsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
  end

  def new
    yaml = YAML.load_file("config/locales/questions.yml")
    @questions = yaml["questions"]["lgbt"]
    @options = yaml["options"]
    @company = Company.find_by(id: params[:company_id])
    @review = Review.new
  end

  def create
    @company = Company.find_by(id: params[:company_id])
    review = Review.new(review_params)
    review.user_id = current_user.id
    @company.reviews << review
    if review.valid?
      @company.save
      flash[:notice] = 'Review created!'
      redirect_to company_path(@company)
    else
      flash[:notice] = 'unable to create review'
      redirect_to new_company_review_path(@company)
    end
  end

  def edit
    @company = Company.find_by(id: params[:company_id])
    @review = Review.find(params[:id])
  end

  def update
    @company = Company.find_by(id: params[:company_id])
    @review = Review.find(params[:id])
    @review.update(review_params)
    redirect_to company_path(@company)
  end

  def destroy
    review = Review.find_by(id: params[:id])
    review.destroy!
    flash[:notice] = 'review deleted'
    redirect_to companies_path
  end

  private

  def review_params
    params.require(:review).permit(:description, :question_1, :question_2, :question_3, :question_4, :question_5, :question_6, :user_id)
  end
end
