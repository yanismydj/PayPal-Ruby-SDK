require_relative '../../test_harness'
require_relative './plan_helper'

include PayPal::V1::BillingPlans

describe PlanUpdateRequest do
  it 'successfully makes a request' do
    create_response = PlanHelper::create_plan
    plan_id = create_response.result.id

    activate_response = PlanHelper::activate_plan(plan_id)

    expect(activate_response.status_code).to eq(200)

    get_response = PlanHelper::get_plan(plan_id)

    expect(get_response.result.state).to eq('ACTIVE')
  end
end
