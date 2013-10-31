module M2mhub
  class Engine < ::Rails::Engine
  	config.autoload_paths += %W(#{config.root}/lib #{config.root}/config)
  end
end
