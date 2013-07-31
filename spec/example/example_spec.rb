require 'spec_helper'
require File.expand_path('../../lib/choose_class', File.dirname(__FILE__))
require File.expand_path('./example1', File.dirname(__FILE__))
require File.expand_path('./example2', File.dirname(__FILE__))
require File.expand_path('./example3', File.dirname(__FILE__))

module ChooseClass
  describe "serializers example 1" do
    describe ".choose_class" do

      it "returns a specialised instance" do
        Example1::SerializerBase.choose_class(1).new.should be_a Example1::FixnumSerializer
      end

      it "returns the generic instance when no specific class available" do
        Example1::SerializerBase.choose_class("string").new.should be_a Example1::SerializerBase
      end

    end
  end

  describe "serializers example 2" do
    describe ".choose_class" do

      it "returns a specialised instance" do
        Example2::SerializerBase.choose_class(1).new.should be_a Example2::Fixnum
      end

      it "returns the generic instance when no specific class available" do
        Example2::SerializerBase.choose_class("string").new.should be_a Example2::SerializerBase
      end

    end
  end

  describe "serializers example 3" do
    describe ".choose_class" do

      it "returns a specialised instance" do
        Example3::Serializers::Base.choose_class(1).new.should be_a Example3::Serializers::Fixnum
      end

      it "returns the generic instance when no specific class available" do
        Example3::Serializers::Base.choose_class("string").new.should be_a Example3::Serializers::Base
      end

    end
  end
end
