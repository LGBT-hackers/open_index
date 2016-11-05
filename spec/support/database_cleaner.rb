require 'database_cleaner'

RSpec.configure do |config|
  config.use_transactional_fixtures = false

  config.before(:each) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    Rails.application.load_seed
  end
end
