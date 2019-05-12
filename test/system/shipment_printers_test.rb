require "application_system_test_case"

class ShipmentPrintersTest < ApplicationSystemTestCase
  setup do
    @shipment_printer = shipment_printers(:one)
  end

  test "visiting the index" do
    visit shipment_printers_url
    assert_selector "h1", text: "Shipment Printers"
  end

  test "creating a Shipment printer" do
    visit shipment_printers_url
    click_on "New Shipment Printer"

    click_on "Create Shipment printer"

    assert_text "Shipment printer was successfully created"
    click_on "Back"
  end

  test "updating a Shipment printer" do
    visit shipment_printers_url
    click_on "Edit", match: :first

    click_on "Update Shipment printer"

    assert_text "Shipment printer was successfully updated"
    click_on "Back"
  end

  test "destroying a Shipment printer" do
    visit shipment_printers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shipment printer was successfully destroyed"
  end
end
