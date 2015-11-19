module ApplicationHelper

	def link_to_admin_level(*args)
		if current_user && current_user.admin?
			link_to(*args)
		end
	end
end
