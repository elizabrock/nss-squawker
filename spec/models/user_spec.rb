require 'spec_helper'

describe User do
  context "normalize username to lowercase" do
    it "should convert username to lowercase" do
      user = Fabricate(:user, username: "JOE")
      user.username.should == "joe"
    end
  end
end
