require 'spec_helper'

describe Squeek do
  context "missing user" do
    it "should not be valid" do
      squeek = Squeek.new(body: "Foo")
      # Equivalent to: refute squeek.valid?
      squeek.should_not be_valid
    end
  end
  context "with a user" do
    it "should be valid" do
      user = Fabricate(:user)
      squeek = Squeek.new(body: "Foo", user: user)
      # Equivalent to: assert squeek.valid?
      squeek.should be_valid
    end
  end
end
