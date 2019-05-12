require 'test_helper'

class ShipmentPrintersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipment_printer = shipment_printers(:one)
  end

  test "should get index" do
    get shipment_printers_url
    assert_response :success
  end

  test "should get new" do
    get new_shipment_printer_url
    assert_response :success
  end

  test "should create shipment_printer" do
    assert_difference('ShipmentPrinter.count') do
      post shipment_printers_url, params: { shipment_printer: {  } }
    end

    assert_redirected_to shipment_printer_url(ShipmentPrinter.last)
  end

  test "should show shipment_printer" do
    get shipment_printer_url(@shipment_printer)
    assert_response :success
  end

  test "should get edit" do
    get edit_shipment_printer_url(@shipment_printer)
    assert_response :success
  end

  test "should update shipment_printer" do
    patch shipment_printer_url(@shipment_printer), params: { shipment_printer: {  } }
    assert_redirected_to shipment_printer_url(@shipment_printer)
  end

  test "should destroy shipment_printer" do
    assert_difference('ShipmentPrinter.count', -1) do
      delete shipment_printer_url(@shipment_printer)
    end

    assert_redirected_to shipment_printers_url
  end
end
