# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( reviews.scss )

Rails.application.config.assets.precompile += %w( nav.scss )

Rails.application.config.assets.precompile += %w( search.scss )

Rails.application.config.assets.precompile += %w( progress.js )

Rails.application.config.assets.precompile += %w( radioButton.js )

Rails.application.config.assets.precompile += %w( favicon.ico )

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
