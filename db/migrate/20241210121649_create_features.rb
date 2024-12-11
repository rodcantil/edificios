class CreateFeatures < ActiveRecord::Migration[8.0]
  def change
    create_table :features do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
