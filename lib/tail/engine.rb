module Tail
  class Engine < ::Rails::Engine
    isolate_namespace Tail

    initializer 'tail.assets.precompile' do |app|
      app.config.assets.precompile += %w(tail/refresh.png tail/cleaning.png tail/up_arrow.png)
    end
  end
end
