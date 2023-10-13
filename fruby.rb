require "./string.rb"

module Fruby
  ROOT = File.join(File.expand_path(File.dirname(__FILE__)), 'app', '/')

  module Main
    def Object.const_missing(name)
      path = File.join(ROOT, name.to_s.snake_case + '.rb')
      if File.exist?(path)
        require path
        Object.const_get(name)
      else
        super
      end
    end

    def y(name = nil, from: Object, &block)
      file_name = caller_locations.first.path.gsub(root, '').gsub('.rb', '')
      klass_name = file_name.pascal_case
      klass = Object.const_set(klass_name, Class.new(from, &block))
      klass
    end

    def root
      Fruby::ROOT
    end
  end
end
