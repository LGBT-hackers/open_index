class FlagsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def create
    review = Review.find(params[:review_id])
    if current_user.has_flagged? review
      flash[:notice] = 'You cannot flag more than once'
      redirect_to "/companies/#{params[:company_id]}"
    else
      review.flags.create({user_id: current_user.id})
      redirect_to "/companies/#{params[:company_id]}"
    end
  end

  def destroy
    review = Review.find(params[:review_id])
    flag = review.flags.find(params[:id])
    if current_user.has_flagged? review or current_user.admin
      flag.destroy
      redirect_to "/companies/#{params[:company_id]}"
    end
  end

  def index
    @flags = Flag.all
  end
end
