module ChooseClass
  class ClassNamingConventions
    class Suffix

      def initialize base_class, suffix
        @base_class = base_class
        @suffix = suffix
      end

      def factory_class_name_from_value_class_name class_name
        if @suffix
          "#{class_name}#{@suffix}"
        else
          # TODO this path is dead code,
          #  but we probably want to resurrect it at some point.
          "#{class_name}#{factory_class_name_suffix}"
        end
      end

      private

      # Eg.
      #     if base class name is "SerializerBase", returns "Serializer"
      #     if base class name is "Penguins", returns nil
      # @return [String, nil]
      def factory_class_name_suffix
        match = class_name_without_namespace(@base_class).match(/(.*)Base$/)
        match && match[1]
      end

      def class_name_without_namespace klass
        ChooseClass::Util.class_name_without_namespace klass
      end

    end
  end
end
