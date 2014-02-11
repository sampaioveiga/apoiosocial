class AddHelpToSocialfamily < ActiveRecord::Migration
	def change
		add_column :socialfamilies, :socialfamilyhelp_id, :integer
	end
end
