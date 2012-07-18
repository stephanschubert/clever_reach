require 'spec_helper'

describe Cleverreach::Configuration do

  let(:klass) { Cleverreach::Configuration }

  it "should be a singleton" do
    klass.included_modules.should include(Singleton)
  end

end
