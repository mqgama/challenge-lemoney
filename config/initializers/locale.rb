# custom locales load path
I18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]

# set default locale to brazilian portuguese
I18n.default_locale = "pt-BR"
