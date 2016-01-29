require "spec_helper"

describe Store do
  describe "#new" do
    it 'creates a new store with name, description, and address' do
      new_store = create_store("Payless", "test description", "1234 test way")
      expect(new_store.name).to(eq("Payless"))
      expect(new_store.description).to(eq("test description"))
      expect(new_store.address).to(eq("1234 test way"))
    end
  end

  describe "add a brand to a store" do
    it 'allows you to add a relation between a given brand and a store' do
      new_store = create_store("Payless", "test description", "1234 test way")
      test_brand = create_brand("Nike", "big brand")
      new_store.brands.push(test_brand)
      expect(new_store.brands).to(eq([test_brand]))
    end
  end

  describe "remove a brand from a store" do
    it 'allows you to add a relation between a given brand and a store' do
      new_store = create_store("Payless", "test description", "1234 test way")
      test_brand = create_brand("Nike", "big brand")
      new_store.brands.push(test_brand)
      new_store.brands.delete(test_brand)
      expect(new_store.brands).to(eq([]))
    end
  end
end
