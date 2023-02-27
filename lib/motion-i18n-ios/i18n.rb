module I18n
  class << self
    def translate(key, substitutions = {})
      str = (NSBundle.mainBundle.localizedStringForKey(key, value:"", table:nil))
      puts str.inspect
      if str.is_a?(ImmediateRef)
        puts str.methods.inspect
      end
      String.new(str).tap do |result|
        substitutions.each do |key, value|
          result.gsub!("%{#{key}}", value.to_s)
        end
      end
    end
    alias t translate

    def locale
      NSLocale.preferredLanguages.first
    end
  end
end