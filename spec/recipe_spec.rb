require 'spec_helper'
require 'pry'

describe Recipe do
  describe "#new" do
    it 'creates a new recipe' do
      new_recipe = Recipe.create({ingredients: "few things", instructions: "cook it" })
      expect(new_recipe.ingredients).to(eq("few things"))
    end
    it 'creates a new recipe with instructions' do
      new_recipe = Recipe.create({ingredients: "few things", instructions: "cook it" })
      expect(new_recipe.instructions).to(eq("cook it"))
    end
  end
end

describe Tag do
  describe "#new" do
    it 'creates a new tag' do
      new_tag = Tag.create({name: "tagName"})
      expect(new_tag.name).to(eq("tagName"))
    end
  end
end

describe "database" do
  it 'creates a new recipe and tag' do
    new_tag = Tag.create({name: "tagName"})
    new_recipe = Recipe.create({ingredients: "things", instructions: "eat"})
    new_recipe.tags.push(new_tag)
    expect(new_tag.recipes).to(eq([new_recipe]))
  end
  it 'creates a new recipe and tag' do
    new_tag = Tag.create({name: "tagName"})
    new_recipe = Recipe.create({ingredients: "things", instructions: "eat"})
    new_tag.recipes.push(new_recipe)
    expect(new_recipe.tags).to(eq([new_tag]))
  end
end
