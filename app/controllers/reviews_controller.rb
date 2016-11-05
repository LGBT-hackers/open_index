class ReviewsController < ApplicationController
  def new
    @company = Company.find_by(id: params[:company_id])
    @review = Review.new
  end

  def create
    @company = Company.find_by(id: params[:company_id])
    review = Review.new(review_params)
    @company.reviews << review
    if review.valid?
      @company.save
      flash[:notice] = 'Review created!'
      p review
      redirect_to company_path(@company)
    else
      flash[:notice] = 'unable to create review'
      redirect_to new_company_review_path(@company)
    end
  end

  private

  def review_params
    params.require(:review).permit(:description, :question_1, :question_2, :question_3, :question_4, :question_5, :question_6).merge(user: current_user)
  end
end
