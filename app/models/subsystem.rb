class Subsystem < ActiveRecord::Base
	has_many :patients, dependent: :nullify

	validates :nome,
		presence: { message: "não pode estar em branco" },
		uniqueness: { message: "já existe na base de dados" }
end
