module ChooseClass
  class ClassNamingConventions
    class Namespace

      def initialize base_class, ns
        @base_class = base_class
        @namespace = ns
      end

      # same namespace as base class
      def factory_namespace
        if @namespace
          @namespace
        else
          ChooseClass::Util.module_parent @base_class
        end
      end

    end
  end
end
