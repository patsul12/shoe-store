require "spec_helper"

describe Brand do
  describe "#new" do
    it 'creates a new brand with name and description' do
      test_brand = create_brand("nike", "big brand")
      expect(test_brand.name).to(eq("nike"))
      expect(test_brand.description).to(eq("big brand"))
    end
  end
end
