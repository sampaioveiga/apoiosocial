class Patient < ActiveRecord::Base
	has_many :episodes
	
	validates :nome,
		presence: { message: "não pode estar em branco" }
	validates :residencia,
		presence: { message: "não pode estar em branco" }
	validates :sistema_de_saude_numero,
		uniqueness: { message: "já existe na base de dados", allow_nil: true}
	validates :cartao_de_cidadao,
		uniqueness: { message: "já existe na base de dados", allow_nil: true}
	validates :numero_identificacao_fiscal,
		uniqueness: { message: "já existe na base de dados", allow_nil: true}
end
