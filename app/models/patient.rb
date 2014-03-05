class Patient < ActiveRecord::Base
	belongs_to	:subsystem
	has_one		:habitation, dependent: :delete
	has_many	:finances, dependent: :delete_all
	has_one		:socialfamily, dependent: :delete
	has_many	:episodes, dependent: :delete_all
	has_many	:contacts, dependent: :delete_all
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	
	validates :nome,
		presence: { message: "não pode estar em branco" }
	validates :data_de_nascimento,
		presence: { message: "não pode estar em branco" }
	validates :telefone,
		numericality: { message: "só pode conter números", allow_nil: true }
	validates :telemovel,
		numericality: { message: "só pode conter números", allow_nil: true }
	validates :rnu,
		uniqueness: { message: "já existe na base de dados", allow_nil: true },
		numericality: { message: "só pode conter números", allow_nil: true }
	validates :subsystem_number,
		uniqueness: { message: "já existe na base de dados", allow_nil: true },
		numericality: { message: "só pode conter números", allow_nil: true }
	validates :cartao_de_cidadao,
		uniqueness: { message: "já existe na base de dados", allow_nil: true },
		numericality: { message: "só pode conter números", allow_nil: true }
	validates :numero_identificacao_fiscal,
		uniqueness: { message: "já existe na base de dados", allow_nil: true },
		numericality: { message: "só pode conter números", allow_nil: true }
#	validates :email,
#		format: { with: VALID_EMAIL_REGEX, allow_nil: true, message: "formato inválido" }
end
