require 'spec_helper'

describe CleverReach::Errors do

  describe CleverReach::Errors::BaseError do

    let(:subject) { CleverReach::Errors::BaseError.new }

    it "should be subclass of StandardError" do
      subject.should be_kind_of(StandardError)
    end

  end

  describe "Custom errors" do

    let(:error_class) { CleverReach::Errors::BaseError }

    it "should define an error for 'invalid API Key'" do
      CleverReach::Errors::InvalidAPIKey.new.should be_kind_of(error_class)
    end

    it "should define an error for 'need session before usage'" do
      CleverReach::Errors::NeedSessionBeforeUsage.new.should be_kind_of(error_class)
    end

    it "should define an error for 'permission denied'" do
      CleverReach::Errors::PermissionDenied.new.should be_kind_of(error_class)
    end

    it "should define an error for 'data not found'" do
      CleverReach::Errors::DataNotFound.new.should be_kind_of(error_class)
    end

    it "should define an error for 'email invalid'" do
      CleverReach::Errors::EmailInvalid.new.should be_kind_of(error_class)
    end

    it "should define an error for 'email blacklisted'" do
      CleverReach::Errors::EmailBlacklisted.new.should be_kind_of(error_class)
    end

    it "should define an error for 'duplicate data'" do
      CleverReach::Errors::DuplicateData.new.should be_kind_of(error_class)
    end

    it "should define an error for 'subscriber already active'" do
      CleverReach::Errors::SubscriberAlreadyActive.new.should be_kind_of(error_class)
    end

    it "should define an error for 'inserting order failed'" do
      CleverReach::Errors::InsertingOrderFailed.new.should be_kind_of(error_class)
    end

    it "should define an error for 'batch to big (max 50)'" do
      CleverReach::Errors::BatchTooBig.new.should be_kind_of(error_class)
    end

    it "should define an error for 'subscriber already inactive'" do
      CleverReach::Errors::SubscriberAlreadyInactive.new.should be_kind_of(error_class)
    end

    it "should define an error for 'given email is too short'" do
      CleverReach::Errors::GivenEmailIsTooShort.new.should be_kind_of(error_class)
    end

    it "should define an error for 'no forms available'" do
      CleverReach::Errors::NoFormsAvailable.new.should be_kind_of(error_class)
    end

    it "should define an error for 'error saving filter'" do
      CleverReach::Errors::ErrorSavingFilter.new.should be_kind_of(error_class)
    end

  end

end
