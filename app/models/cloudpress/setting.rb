module Cloudpress
  class Setting < ActiveRecord::Base

    def self.method_missing(method, *args, &block)
      if method.to_s.chars.include? '='
        write(method.to_s, *args)
      else
        read(method.to_s)
      end
    end

    def self.read(method)
      where(key: method).first.try(:value)
    end

    def self.write(method, *args)
      setting = where(key: method.gsub("=", '')).first_or_initialize
      setting.value = args.join(' ')
      setting.save
    end
    
  end
end
