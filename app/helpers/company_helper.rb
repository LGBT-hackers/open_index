module CompanyHelper
  def get_unique(companies)
    companies.map {|company| company.name }.uniq
  end

  def search_contains_characters(params)
    match_data = params[:name] =~ /\w/
    match_data != nil
  end
end
