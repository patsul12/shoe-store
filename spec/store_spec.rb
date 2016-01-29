require "spec_helper"

describe Store do
  describe "#new" do
    it 'creates a new store with name, description, and address' do
      new_store = create_store("payless", "test description", "1234 test way")
      expect(new_store.name).to(eq("payless"))
      expect(new_store.description).to(eq("test description"))
      expect(new_store.address).to(eq("1234 test way"))
    end
  end
end
