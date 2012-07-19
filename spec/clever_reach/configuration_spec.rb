require 'spec_helper'

describe CleverReach::Configuration do

  let(:klass) { CleverReach::Configuration }

  it "should be a singleton" do
    klass.included_modules.should include(Singleton)
  end

  describe "Default configuration" do

    let(:defaults) do
      {
        wsdl_url: 'http://api.cleverreach.com/soap/interface_v5.1.php?wsdl'
      }
    end

    it "should have some default settings" do
      klass.defaults.should == defaults
    end

    it "should use the default settings automatically" do
      config = CleverReach.config
      keys   = config.instance_variables.map { |name| name.to_s.sub('@', '').to_sym }

      keys.should include(*defaults.keys)
    end

  end

end
