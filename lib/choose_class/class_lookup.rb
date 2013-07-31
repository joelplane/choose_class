module ChooseClass
  class ClassLookup

    # @param rules [ChooseClass::ClassNamingConventions]
    def initialize rules
      @rules = rules
    end

    # @param value_class_name [String]
    def find_class_by_name value_class_name
      class_name = factory_class_name value_class_name
      begin
        ChooseClass::Util.local_const_get(@rules.factory_namespace, class_name) ||
          @rules.base_class
      rescue NameError => e
        if e.message =~ /#{@rules.factory_namespace.name}::#{class_name}$/
          @rules.base_class
        else
          raise e # not the error we were expecting, so re-raise
        end
      end
    end

    private

    # @param value_class_name [String]
    def factory_class_name value_class_name
      @rules.factory_class_name_from_value_class_name value_class_name
    end

  end
end
