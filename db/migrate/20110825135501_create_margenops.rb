class CreateMargenops < ActiveRecord::Migration
  def self.up
    create_table :margenops do |t|
      t.integer :version
      t.string :empresa
      t.string :tarifa
      t.integer :periodo
      t.string :estado
      t.string :concepto
      t.integer :cantidad
      t.decimal :consumo_vta
      t.decimal :consumo_cpa
      t.decimal :importe_vta
      t.decimal :importe_cpa
      t.decimal :importe_mgn

      t.timestamps
    end
  end

  def self.down
    drop_table :margenops
  end
end
