require "spec_helper"

describe Store do
  describe "#new" do
    it 'creates a new recipe' do
      new_store = create_store
      expect(new_store.name).to(eq("nike"))
    end
    it 'creates a new recipe with description' do
      new_store = create_store
      expect(new_store.description).to(eq("big brand shoe store."))
    end
  end
end

def create_store
  new_store = Store.create({name: "nike", description: "big brand shoe store." })
end
