require_relative '../../test_harness'
require_relative './plan_helper'

include PayPal::V1::BillingPlans

describe PlanCreateRequest do
  it 'successfully makes a request' do
    resp = PlanHelper::create_plan
    expect(resp.status_code).to eq(201)
    expect(resp.result).not_to be_nil
  end
end
