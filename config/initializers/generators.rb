# http://guides.rubyonrails.org/generators.html
Rails.application.config.generators do |g|
  g.helper false
  g.fixture_replacement :factory_bot, dir: "spec/factories"
  g.test_framework :rspec,
                   fixtures: true,
                   view_specs: false,
                   helper_specs: false,
                   routing_specs: false,
                   controller_specs: false,
                   request_specs: false
end
