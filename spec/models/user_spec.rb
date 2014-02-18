require 'spec_helper'

describe User do
  context "normalize username to lowercase" do
    it "should not convert username to lowercase" do
      user = Fabricate(:user, username: "JOE")
      user.reload
      user.username.should == "JOE"
    end
  end
end
