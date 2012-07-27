require 'spec_helper'

describe CleverReach::Errors do

  describe CleverReach::Errors::BaseError do # -------------

    let(:subject) { CleverReach::Errors::BaseError.new }

    it "should be subclass of StandardError" do
      subject.should be_kind_of(StandardError)
    end

  end

  describe "Custom errors" do # ----------------------------

    let(:error_scope) { CleverReach::Errors }
    let(:error_class) { error_scope::BaseError }

    it "should define an error for 'invalid API Key'" do
      error = error_scope::InvalidAPIKey.new
      error.should be_kind_of(error_class)
      error.message.should == 'invalid API key'
    end

    it "should define an error for 'need session before usage'" do
      error = error_scope::NeedSessionBeforeUsage.new
      error.should be_kind_of(error_class)
      error.message.should == 'need session before usage'
    end

    it "should define an error for 'permission denied'" do
      error = error_scope::PermissionDenied.new
      error.should be_kind_of(error_class)
      error.message.should == 'permission denied'
    end

    it "should define an error for 'data not found'" do
      error = error_scope::DataNotFound.new
      error.should be_kind_of(error_class)
      error.message.should == 'data not found'
    end

    it "should define an error for 'email invalid'" do
      error = error_scope::EmailInvalid.new
      error.should be_kind_of(error_class)
      error.message.should == 'email invalid'
    end

    it "should define an error for 'email blacklisted'" do
      error = error_scope::EmailBlacklisted.new
      error.should be_kind_of(error_class)
      error.message.should == 'email blacklisted'
    end

    it "should define an error for 'duplicate data'" do
      error = error_scope::DuplicateData.new
      error.should be_kind_of(error_class)
      error.message.should == 'duplicate data'
    end

    it "should define an error for 'subscriber already active'" do
      error = error_scope::SubscriberAlreadyActive.new
      error.should be_kind_of(error_class)
      error.message.should == 'subscriber already active'
    end

    it "should define an error for 'inserting order failed'" do
      error = error_scope::InsertingOrderFailed.new
      error.should be_kind_of(error_class)
      error.message.should == 'inserting order failed'
    end

    it "should define an error for 'batch to big (max 50)'" do
      error = error_scope::BatchTooBig.new
      error.should be_kind_of(error_class)
      error.message.should == 'batch too big (max 50)'
    end

    it "should define an error for 'subscriber already inactive'" do
      error = error_scope::SubscriberAlreadyInactive.new
      error.should be_kind_of(error_class)
      error.message.should == 'subscriber already inactive'
    end

    it "should define an error for 'given email is too short'" do
      error = error_scope::GivenEmailIsTooShort.new
      error.should be_kind_of(error_class)
      error.message.should == 'given email is too short'
    end

    it "should define an error for 'no forms available'" do
      error = error_scope::NoFormsAvailable.new
      error.should be_kind_of(error_class)
      error.message.should == 'no forms available'
    end

    it "should define an error for 'error saving filter'" do
      error = error_scope::ErrorSavingFilter.new
      error.should be_kind_of(error_class)
      error.message.should == 'error saving filter'
    end

  end

  describe ".lookup" do # ----------------------------------

    CleverReach::Errors::ErrorMap.each do |code, klass|
      it "should map error code #{code} to an error class '#{klass.name}'" do
        subject.lookup(code).should == klass
      end
    end

  end


end
