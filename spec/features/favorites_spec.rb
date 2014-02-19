require 'spec_helper'

describe "Favoriting squeeks" do
  # Equivalent in cucumber steps:
  # Given I am logged in
  # And the following:
  #   | username | joe |
  # And that user has the following squeek:
  #   | body | I'm joe!! |
  # When I go to the homepage
  # And I click "Favorite this squeek"
  # Then that squeek should be in my favorites list
  # When I go to my profile page
  # Then I should see "I'm joe" in my favorites list
  context "favoriting someone's queek" do
    before do
      @me = Fabricate(:user)
      signin_as @me
      @joe = Fabricate(:user, username: "joe")
      Fabricate(:squeek, body: "I'm joe!!", user: @joe)
      visit '/'
      click_link "Favorite this squeek"
    end
    it "should display a success message" do
      page.should have_content "You have favorited joe's squeek: \"I'm joe!!\""
    end
    it "should be in my list of favorites" do
      @me.favorite_squeeks.should include(@joe.squeeks.last)
    end
    it "should show on my profile page" do
      visit user_path(@me)
      within(".favorites") do
        page.should have_content("I'm joe!!")
      end
    end
  end
  context "a squeek that's already been favorited" do
    it "shouldn't have a link to favorite" do
      pending
    end
    it "should say 'Favorited'" do
      pending
    end
  end
end
