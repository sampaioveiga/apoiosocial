class Episode < ActiveRecord::Base
	belongs_to :patient

	validates :servico_referenciador,
		presence: { message: "não pode estar em branco" }
end
