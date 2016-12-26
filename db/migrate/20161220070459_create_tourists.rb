class CreateTourists < ActiveRecord::Migration
  def change
    create_table :tourists do |t|
      t.string :year_of_birth
      t.timestamps null: false
    end
  end
end
