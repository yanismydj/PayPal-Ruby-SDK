require_relative '../../test_harness'
require_relative './plan_helper'

include PayPal::V1::BillingPlans

describe PlanGetRequest do
  it 'successfully makes a request' do
    create_response = PlanHelper::create_plan

    get_response = PlanHelper::get_plan(create_response.result.id)

    expect(get_response.status_code).to eq(200)
    expect(get_response.result).not_to be_nil
    expect(get_response.result.id).to eq(create_response.result.id)
  end
end
