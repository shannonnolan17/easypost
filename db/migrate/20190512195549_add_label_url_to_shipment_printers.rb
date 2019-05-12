class AddLabelUrlToShipmentPrinters < ActiveRecord::Migration[5.2]
  def change
    add_column :shipment_printers, :label_url, :string
  end
end
