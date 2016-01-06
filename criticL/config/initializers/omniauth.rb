
# require "omniauth-facebook"



OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1003687123020807', 'e112d0f2cc3684a31c4148724e4a6cbb',
  {
    strategy_class: OmniAuth::Strategies::Facebook,
    provider_ignores_state: true,

  }

  # {:scope => fb_permissions, :provider_ignores_state => true}


end


# Rails.application.config.omniauth :facebook, ENV['1003687123020807'], ENV['e112d0f2cc3684a31c4148724e4a6cbb'], {
#   strategy_class: OmniAuth::Strategies::Facebook,
#   provider_ignores_state: true,
# }