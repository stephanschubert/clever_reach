require 'spec_helper'

describe CleverReach::Configuration do

  let(:klass) { CleverReach::Configuration }

  it "should be a singleton" do
    klass.included_modules.should include(Singleton)
  end

end
