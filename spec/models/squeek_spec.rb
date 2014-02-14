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

describe 'images' do
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
