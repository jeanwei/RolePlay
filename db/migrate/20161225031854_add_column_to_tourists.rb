class AddColumnToTourists < ActiveRecord::Migration
  def change
    add_reference :tourists, :tour_guide, index: true, foreign_key: true
    add_reference :tourists, :translator, index: true, foreign_key: true
  end
end
