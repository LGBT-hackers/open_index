module CompaniesHelper

  def search_contains_characters(params)
    match_data = params[:name] =~ /\w/
    match_data != nil
  end

  def company_params
    if params['company']
      params['company'].permit(:name, :industry, :logoUrl, :website)
    else
      params.permit(:name, :industry, :logoUrl, :website)
    end
  end

  def success_redirect(name, id)
    flash[:notice] = "Your company named \"#{name}\" has been submitted."
    redirect_to "/companies/#{id}"
  end

  def fail_redirect(company)
    flash[:alert] = company.errors.empty? ? generic_error : specific_error(company)
    redirect_to '/companies/new'
  end

  def generic_error
    return "Sorry, there was a problem submitting your company."
  end

  def specific_error(company)
    company.errors.full_messages.to_sentence
  end
end
