class CreatePrinters < ActiveRecord::Migration[5.0]
  def change
    create_table :printers do |t|

      t.timestamps
    end
  end
end
