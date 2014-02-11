class User < ActiveRecord::Base
	has_secure_password
	before_save { self.email = email.downcase }
	has_many	:episodes

	validates :nome,
		presence: { message: "não pode estar vazio" }
	validates :numero_mecanografico,
		presence: { message: "não pode estar vazio" },
		length: { is: 5, message: "tem de possuir 5 números" },
		numericality: { message: "só pode conter números" },
		uniqueness: { message: "já existe na base de dados" }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email,
		presence: { message: "não pode estar vazio" },
		uniqueness: { message: "já existe na base de dados" },
		format: { with: VALID_EMAIL_REGEX, message: "formato inválido" }
	validates :password,
		presence: { message: "não pode estar vazio" },
		on: :create,
		length: { minimum: 5, message: "tem de possuir mais de 5 caracteres" }
end