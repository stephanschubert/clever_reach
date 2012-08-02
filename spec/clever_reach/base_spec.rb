require 'spec_helper'

describe CleverReach::Base do

  let(:wsdl_url) { "http://api.test.com/wsdl" }
  let(:api_key)  { "12345" }
  let(:client)   { subject.client }

  before :all do
    CleverReach.configure do |config|
      config.wsdl_url = wsdl_url
      config.api_key  = api_key
    end
  end

  describe "#new" do # -------------------------------------

    it "should use the configured API key" do
      subject.api_key.should == api_key
    end

  end

  describe "#client" do # ----------------------------------

    it "should return configured Savon::Client" do
      client.should be_instance_of(Savon::Client)
      client.wsdl.document.should == wsdl_url
    end

    it "should re-use the client" do
      client.should == client
    end

  end

  describe "Response w/ errors" do # -----------------------

    let(:body_with_errors) do
      { :foo_response => { :return => { :status => 'ERROR', :statuscode => '30' } } }
    end

    let(:response) { stub(body: body_with_errors) }

    before :each do
      subject.should_receive(:request).with(:foo, anything).and_return(response)
    end

    it "should raise the appropiate error" do
      lambda { subject.foo }.should raise_error(CleverReach::Errors::EmailInvalid)
    end

  end

  # TODO Can't figure out how to stub/mock requests for Savon.
  #      I'v opened a new issue on github asking for some documentation.
  #
  #      https://github.com/rubiii/savon/issues/307
  #
  # it "blah" do
  #   savon.expects(:client_get_details).with('apiKey' => api_key).returns({})
  #   subject.client_get_details
  # end

  # describe "A request" do # --------------------------------

  #   it "should return a ResponseDecorator" do
  #     subject.foobar.should be_instance_of(ResponseDecorator)
  #   end

  # end

end
