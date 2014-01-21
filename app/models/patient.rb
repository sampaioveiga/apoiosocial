class Patient < ActiveRecord::Base
	belongs_to :subsystem
	has_one :habitation, dependent: :delete
	has_one :finance, dependent: :delete
	has_one :socialfamily, dependent: :delete
	
	validates :nome,
		presence: { message: "não pode estar em branco" }
	validates :residencia,
		presence: { message: "não pode estar em branco" }
	validates :subsystem_number,
		uniqueness: { message: "já existe na base de dados", allow_nil: true}
	validates :cartao_de_cidadao,
		uniqueness: { message: "já existe na base de dados", allow_nil: true}
	validates :numero_identificacao_fiscal,
		uniqueness: { message: "já existe na base de dados", allow_nil: true}
end
