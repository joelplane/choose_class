module ChooseClass
  class Config

    def initialize base_class
      @rules = []
      @base_class = base_class
    end

    def namespace ns
      @rules << ChooseClass::ClassNamingConventions::Namespace.new(@base_class, ns)
      self
    end

    def with_suffix suffix
      @rules << ChooseClass::ClassNamingConventions::Suffix.new(@base_class, suffix)
      self
    end

    # @return [ChooseClass::ClassNamingConventions]
    def naming_convention
      ChooseClass::ClassNamingConventions.new @base_class, @rules
    end

  end
end
