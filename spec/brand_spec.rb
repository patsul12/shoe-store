require "spec_helper"

describe Brand do
  describe "#new" do
    it 'creates a new brand with name and description' do
      test_brand = create_brand("nike", "big brand")
      expect(test_brand.name).to(eq("nike"))
      expect(test_brand.description).to(eq("big brand"))
    end
  end

  describe "add a store to a brand" do
    it 'allows you to add a relation between a given brand and a store' do
      new_store = create_store("payless", "test description", "1234 test way")
      test_brand = create_brand("nike", "big brand")
      test_brand.stores.push(new_store)
      expect(test_brand.stores).to(eq([new_store]))
    end
  end
end
