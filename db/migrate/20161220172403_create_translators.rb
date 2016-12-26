class CreateTranslators < ActiveRecord::Migration
  def change
    create_table :translators do |t|
      t.references :agency, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
