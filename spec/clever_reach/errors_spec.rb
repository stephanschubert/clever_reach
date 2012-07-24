require 'spec_helper'

describe CleverReach::Errors do

  describe CleverReach::Errors::BaseError do

    let(:subject) { CleverReach::Errors::BaseError.new }

    it "should be subclass of StandardError" do
      subject.should be_kind_of(StandardError)
    end

  end

end
