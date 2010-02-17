module CachesMethod
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def caches_method(method, cache_options = {})
      alias_method "uncached_#{method}", method

      define_method method do |*args|
        key = cache_key + "/#{method}/#{args}"
        result = Rails.cache.read(key)
        return result if result

        result = send("uncached_#{method}", *args)
        Rails.cache.write(key, result, cache_options)
        result
      end
    end
  end
end

ActiveRecord::Base.send(:include, CachesMethod)
