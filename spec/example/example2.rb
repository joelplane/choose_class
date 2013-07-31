module ChooseClass
  module Example2

    class SerializerBase
      include ChooseClass::Base
      choose_class_config.namespace(Example2).with_suffix("")
    end

    # Specialisation class for Fixnum values
    # Does not have to be a subclass of SerializerBase, but is in this case.
    class Fixnum < SerializerBase

    end

  end
end
