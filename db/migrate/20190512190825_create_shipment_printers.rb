class CreateShipmentPrinters < ActiveRecord::Migration[5.2]
  def change
    create_table :shipment_printers do |t|

      t.timestamps
    end
  end
end
