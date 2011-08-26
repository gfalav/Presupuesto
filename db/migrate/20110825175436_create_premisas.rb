class CreatePremisas < ActiveRecord::Migration
  def self.up
    create_table :premisas do |t|
      t.string :empresa
      t.integer :version
      t.string :nombre
      t.integer :periodo
      t.decimal :valor

      t.timestamps
    end
  end

  def self.down
    drop_table :premisas
  end
end
