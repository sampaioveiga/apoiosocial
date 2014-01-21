class Habitationtype < ActiveRecord::Base
	has_many :habitations

	validates :nome,
		presence: { message: "não pode estar vazio" },
		uniqueness: { message: "já existe na base de dados" }
end
