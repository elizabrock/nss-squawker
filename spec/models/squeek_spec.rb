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
  context "consumer only" do
    before do 
      @user1 = Fabricate(:user)
      @user2 = Fabricate(:user)
      @user3 = Fabricate(:user)
      @relationship = Fabricate(:relationship, broadcaster: @user1, consumer: @user2)
      @squeek = Squeek.new(body: "Foo", user: @user1, consumers_only: true)
    end

    it "should be true if user is a consumer" do
      result = @squeek.viewable_by? @user2
      result.should be_true
    end
    it "should be false if user is a consumer" do
      result = @squeek.viewable_by? @user3
      result.should be_false
    end
    it "should be true if user is the Squawker" do
      result = @squeek.viewable_by? @user1
      result.should be_true
    end
  end
  context "non-consumer-only" do
    before do
      @user1 = Fabricate(:user)
      @user2 = Fabricate(:user)
      @user3 = Fabricate(:user)
      @relationship = Fabricate(:relationship, broadcaster: @user1, consumer: @user2)
      @squeek = Squeek.new(body: "Foo", user: @user1, consumers_only: false)
    end

    it "should be viewable by all users" do
      result = []
      [@user1, @user2, @user3].each do |user|
        viewable = @squeek.viewable_by? user 
        result << viewable
      end
      expected = [true, true, true]
      (result == expected).should be_true
    end
  end
end