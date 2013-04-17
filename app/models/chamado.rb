class Chamado < ActiveRecord::Base
  attr_accessible :ativo, :data_abertura, :data_fechamento, :descricao, :prioridade, :status
end
