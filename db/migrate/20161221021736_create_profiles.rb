class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :profileable, polymorphic: true, index: true
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
