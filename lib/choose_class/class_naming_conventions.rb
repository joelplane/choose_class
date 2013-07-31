module ChooseClass
  class ClassNamingConventions

    attr_reader :base_class

    # @param [Class] base_class
    # @param [Array] rules
    def initialize base_class, rules
      @base_class = base_class
      @rules = rules
      set_default_rules
    end

    def factory_namespace
      rule = @rules.detect do |rule|
        rule.respond_to? :factory_namespace
      end
      rule.factory_namespace
    end

    def factory_class_name_from_value_class_name class_name
      @rules.each do |rule|
        if rule.respond_to? :factory_class_name_from_value_class_name
          class_name = rule.factory_class_name_from_value_class_name class_name
        end
      end
      class_name
    end

    private

    def set_default_rules
      if @rules.none?{|r|r.respond_to? :factory_namespace}
        @rules << ChooseClass::ClassNamingConventions::Namespace.new(@base_class, nil)
      end
      if @rules.none?{|r|r.respond_to? :factory_class_name_from_value_class_name}
        @rules << ChooseClass::ClassNamingConventions::Suffix.new(@base_class, "")
      end
    end

  end
end

rules_dir = File.expand_path('./class_naming_conventions', File.dirname(__FILE__))
Dir[File.join(rules_dir,"*.rb")].each do |file|
  require file
end
