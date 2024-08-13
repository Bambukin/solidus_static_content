# frozen_string_literal: true

require 'spree/core'
require 'solidus_static_content'

module SolidusStaticContent
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace SolidusStaticContent

    engine_name 'solidus_static_content'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer 'solidus_static_content.configure_backend' do
      next unless ::Spree::Backend::Config.respond_to?(:menu_items)

      Spree::Backend::Config.configure do |config|
        config.menu_items << config.class::MenuItem.new(
          label: :pages,
          icon: 'file-text',
          condition: -> { can?(:admin, Spree::Page) },
        )
      end
    end
  end
end
