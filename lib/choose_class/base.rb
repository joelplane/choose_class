module ChooseClass
  module Base

    module ClassMethods
      def choose_class_config
        @config ||= Config.new(self)
      end

      def choose_class value
        class_name = class_name_for_value value
        convention = choose_class_config.naming_convention
        ClassLookup.new(convention).find_class_by_name class_name
      end

      private

      # @return [String] class name
      def class_name_for_value value
        ChooseClass::Util.class_name_without_namespace value.class
      end

    end

    def self.included base
      base.extend ClassMethods
    end

  end
end
