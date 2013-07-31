module ChooseClass
  module Example1

    class SerializerBase
      include ChooseClass::Base
      choose_class_config.namespace(Example1).with_suffix("Serializer")
    end

    # Specialisation class for Fixnum values
    class FixnumSerializer

    end

  end
end
