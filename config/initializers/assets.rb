# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|woff2|ttf)\z/
Rails.application.config.assets.precompile += %w( bootstrap/css/bootstrap.min.css )
Rails.application.config.assets.precompile += %w( font-awesome/css/font-awesome.css )
Rails.application.config.assets.precompile += %w( animate.css )
Rails.application.config.assets.precompile += %w( style.css )
Rails.application.config.assets.precompile += %w( custom.css )
Rails.application.config.assets.precompile += %w( animate.css )
Rails.application.config.assets.precompile += %w( plugins/toastr/toastr.min.css )
Rails.application.config.assets.precompile += %w( jquery-3.1.1.min.js )
Rails.application.config.assets.precompile += %w( bootstrap.min.js )
Rails.application.config.assets.precompile += %w( plugins/metisMenu/jquery.metisMenu.js )
Rails.application.config.assets.precompile += %w( plugins/slimscroll/jquery.slimscroll.min.js )
Rails.application.config.assets.precompile += %w( inspinia.js )
Rails.application.config.assets.precompile += %w( plugins/pace/pace.min.js )
Rails.application.config.assets.precompile += %w( plugins/jquery-ui/jquery-ui.min.js )
Rails.application.config.assets.precompile += %w( plugins/toastr/toastr.min.js )






