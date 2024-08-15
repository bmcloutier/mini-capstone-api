require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: "Test", email: "[test@test.com](mailto:test@test.com)", password: "password", admin: true)
    post "/sessions.json", params: { email: "[test@test.com](mailto:test@test.com)", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/products.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Product.count, data.length
  end

  test "create" do
    assert_difference "Product.count", 1 do
      post "/products.json", headers: { "Authorization" => "Bearer #{@jwt}" }, params: { name: "test product", price: 1, description: "test description", image_url: "test.jpg", supplier_id: Supplier.first.id }
    end
  end

  test "show" do
    get "/products/#{Product.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "name", "price", "tax", "total", "supplier", "images", "primary_image_url", "description", "is_discounted?", "categories", "created_at", "updated_at"], data.keys
  end

  test "update" do
    product = Product.first
    patch "/products/#{product.id}.json", headers: { "Authorization" => "Bearer #{@jwt}" }, params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Product.count", -1 do
      delete "/products/#{Product.first.id}.json", headers: { "Authorization" => "Bearer #{@jwt}" }
      assert_response 200
    end
  end
end
