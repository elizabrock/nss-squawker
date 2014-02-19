require 'spec_helper'

describe User do
  context "username" do
    it "should be required" do
      user = Fabricate.build(:user, username: "")
      expect(user.errors_on(:username)).to include("can't be blank")
    end
    it "should be unique" do
      Fabricate(:user, username: "bob")
      user = Fabricate.build(:user, username: "bob")
      expect(user.errors_on(:username)).to include("has already been taken")
    end
    it "should not convert username to lowercase" do
      user = Fabricate(:user, username: "JOE")
      user.reload
      user.username.should == "JOE"
    end
  end
end
