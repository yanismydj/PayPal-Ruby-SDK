require_relative '../../test_harness'
require_relative './pe_helper'
require 'json'

include PayPal::V1::PaymentExperience

describe WebProfileCreateRequest do
  it 'successfully makes a request' do
    begin
    create_response = PaymentExperienceHelper::create_profile
    rescue Exception => e
      puts e.status_code
      puts e.result
    end

    expect(create_response.status_code).to eq(201)
    expect(create_response.result).not_to be_nil
    expect(create_response.result.presentation.brand_name).to eq('example supply & co')
  end
end
