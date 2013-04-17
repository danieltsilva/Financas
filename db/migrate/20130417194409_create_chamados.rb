class CreateChamados < ActiveRecord::Migration
  def change
    create_table :chamados do |t|
      t.string :status
      t.string :ativo
      t.string :descricao
      t.integer :prioridade
      t.datetime :data_abertura
      t.datetime :data_fechamento

      t.timestamps
    end
  end
end
