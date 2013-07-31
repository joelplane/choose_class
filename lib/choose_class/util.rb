module ChooseClass
  module Util
    class << self

      # Copied from ActiveSupport Module#parent
      def module_parent mod
        module_parent_name(mod) ? constantize(module_parent_name(mod)) : Object
      end

      # Copied from ActiveSupport in Rails 3.
      def constantize camel_cased_word
        names = camel_cased_word.split('::')
        names.shift if names.empty? || names.first.empty?

        constant = Object
        names.each do |name|
          constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
        end
        constant
      end

      # Copied/adapted from ActiveSupport Module#parents
      def module_parents mod
        parents = []
        if (parent_name = module_parent_name mod)
          parts = parent_name.split('::')
          until parts.empty?
            parents << constantize(parts * '::')
            parts.pop
          end
        end
        parents << Object unless parents.include? Object
        parents
      end

      # @param klass [Class]
      # @return [String]
      def class_name_without_namespace klass
        klass.name.split('::').last
      end

      # If the constant is not found, const_get will search on Object
      # which might find a class or module we don't want - we only want modules
      # inside the namespace given.
      # This method wraps const_get, throwing away the result if it is not
      # within the namespace.
      # @param namespace [Class, Module]
      # @param symbol [Symbol]
      # @return [Class, Module, nil]
      def local_const_get namespace, symbol
        return nil unless namespace.const_defined?(symbol)
        found_class = namespace.const_get(symbol)
        if module_parents(found_class).include?(namespace)
          found_class
        else
          nil
        end
      end

      private

      # Copied from ActiveSupport Module#parent_name
      def module_parent_name mod
        mod.name =~ /::[^:]+\Z/ ? $`.freeze : nil
      end

    end
  end
end
