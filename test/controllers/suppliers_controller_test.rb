require "test_helper"

class SuppliersControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/suppliers.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Supplier.count, data.length
  end

  # test "create" do
  #   assert_difference "Supplier.count", 1 do
  #     post "/suppliers.json", params: { name: "test supplier", email: "test@example.com", phone_number: "345-678-9012" }
  #   end
  # end
end
