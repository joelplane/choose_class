module ChooseClass
  module Example3

    module Serializers
      class Base
        include ChooseClass::Base
        # not calling choose_class_config in this example
      end

      # Specialisation class for Fixnum values
      class Fixnum
      end
    end

  end
end
