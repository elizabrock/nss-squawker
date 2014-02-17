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

  context "with a user & body" do
    it "should not be hidden" do
      user = Fabricate(:user)
      squeek = Squeek.create(body: "Foo", user: user)
      squeek.hidden.should be_false
    end
  end
  context "with a user & body after delete" do
    it "should be hidden" do
      user = Fabricate(:user)
      squeek = Squeek.create(body: "Foo", user: user)
      squeek.destroy
      squeek.reload
      squeek.hidden.should be_true
    end
  end
  context "after delete" do
    it "should not display" do
      user = Fabricate(:user)
      squeek = Squeek.create(body: "Foo", user: user)
      squeek.destroy
      Squeek.all.count.should == 0
    end
  end

  context 'images' do
    include CarrierWave::Test::Matchers
    before do
      ImageUploader.enable_processing = true
    end
    it 'are resized' do
      path = Rails.root.join *%w[ spec data cat.png ]
      squeek = Squeek.create(body: "Cat Picture", image: path.open)

      squeek.image.thumb.should be_no_larger_than(500, 500)
    end
    after do
      ImageUploader.enable_processing = false
    end
  end
end
