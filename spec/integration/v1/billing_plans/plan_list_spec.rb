require_relative '../../test_harness'
require_relative './plan_helper'

include PayPal::V1::BillingPlans

describe PlanListRequest do
  it 'successfully makes a request' do
    PlanHelper::create_plan

    request = PlanListRequest.new()

    resp = TestHarness::client.execute(request)
    expect(resp.status_code).to eq(200)
    expect(resp.result).not_to be_nil
  end
end
