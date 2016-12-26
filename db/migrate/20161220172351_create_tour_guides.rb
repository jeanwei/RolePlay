class CreateTourGuides < ActiveRecord::Migration
  def change
    create_table :tour_guides do |t|
      t.references :agency, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
