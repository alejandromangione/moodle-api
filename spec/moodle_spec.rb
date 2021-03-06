require 'spec_helper'

RSpec.describe "Moodle" do

  before(:all) do
    Moodle::Connector.mdl_url = "http://someurlmoodle.com"
    Moodle::Connector.mdl_token = "token"
  end

  it 'consult course by id' do
    VCR.use_cassette('response_course_by_id') do
      response = Moodle::Connector.course_by_id(5)

      expect(response).to be_a Hash
      expect(response['id']).to eq(5)
    end
  end

  it 'should valid token' do
    VCR.use_cassette('get_token_valid') do
      response = Moodle::Connector.get_token("user", "pass", "service")

      expect(response).to be_a Hash
      expect(response[:valid]).to eq(true)
    end
  end

end