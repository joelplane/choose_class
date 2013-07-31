# choose_class

Facilitates choosing a class based on the value that would be passed to that class.
Useful for implementing the factory method pattern.

## Installation

Add this line to your application's Gemfile:

    gem 'choose_class'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install choose_class

## Example Usage

Include ChooseClass::Base into your base class. It will gain a choose_class
method. Call choose_class and pass it a value by which to decide which class
to return.

Say we're implementing an object serializer of some sort. We may have a base
class that implments some common functionalty, and then several subclasses
that specialise the serialization for specific types.

We want to determine which class to use based on the object we are to
serialize.

```ruby
module Serializers
  class Base
    include ChooseClass::Base
  end

  # Specialisation class for Fixnum values
  class Fixnum < Base
  end
end
```

elsewhere:

```ruby
  Serializers.choose_class(1) # => Serializers::Fixnum
```

The class chosen was Serializers::Fixnum because it is a class in the same
namespace as the base class, and it has the same name as the class of the value
passed in. (These conventions are configurable in a limited way. See spec/example)

```ruby
Serializers.choose_class("some string") # => Serializers::Base
```

The class chosen was Serializers::Base because there was no Serializers::String
class to choose instead.

To complete the serializer example, a final implementation might look something
like this:

```ruby
module Serializers
  class Base
    include ChooseClass::Base

    def self.serialize value
      choose_class(value).new(value).serialize
    end

    def serialize
      # general object serialization implementation
    end
  end

  # Specialisation class for Fixnum values
  class Fixnum < Base
    def serialize
      # fixnum-specific serialization implementation
    end
  end
end

Serializers.serialize(1) # => output of Serializers::Fixnum.serialize
Serializers.serialize("some string") # => output of Serializers::Base.serialize
```

See also spec/example.
