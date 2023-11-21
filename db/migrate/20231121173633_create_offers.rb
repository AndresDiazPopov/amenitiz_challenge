class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :title
      t.string :discount_type
      t.float :discount_amount

      t.timestamps
    end
  end
end
