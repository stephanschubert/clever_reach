require 'spec_helper'

describe Cleverreach do

  let(:klass) { Cleverreach }

  it "should have a VERSION" do
    klass::VERSION.should_not be_nil
  end

  describe "Configuration" do # ----------------------------

    it "should have a configuration instance" do
      klass.config.should be_instance_of(klass::Configuration)
    end

    it "should support configuration with a block" do
      klass::Configuration.class_eval { attr_accessor :foo }

      klass.configure do |config|
        config.foo = :bar
      end

      klass.config.foo.should == :bar
    end

  end

end
