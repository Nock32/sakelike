class CreateBrewers < ActiveRecord::Migration[6.0]
  def change
    create_table :brewers do |t|
      t.string     :name,         null: false
      t.text       :explanation,  null: false
      t.string     :address,      null: false
      t.integer    :area_id,      null: false
      t.references :user,         foreign_key: true
      t.timestamps
    end
  end
end
