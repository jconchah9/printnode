class CreatePrinternodes < ActiveRecord::Migration[5.0]
  def change
    create_table :printernodes do |t|

      t.timestamps
    end
  end
end
