require "application_system_test_case"

class BuzzsTest < ApplicationSystemTestCase
  setup do
    @buzz = buzzs(:one)
  end

  test "visiting the index" do
    visit buzzs_url
    assert_selector "h1", text: "Buzzs"
  end

  test "creating a Buzz" do
    visit buzzs_url
    click_on "New Buzz"

    fill_in "Content", with: @buzz.content
    fill_in "Name", with: @buzz.name
    click_on "Create Buzz"

    assert_text "Buzz was successfully created"
    click_on "Back"
  end

  test "updating a Buzz" do
    visit buzzs_url
    click_on "Edit", match: :first

    fill_in "Content", with: @buzz.content
    fill_in "Name", with: @buzz.name
    click_on "Update Buzz"

    assert_text "Buzz was successfully updated"
    click_on "Back"
  end

  test "destroying a Buzz" do
    visit buzzs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Buzz was successfully destroyed"
  end
end
