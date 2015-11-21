module ApplicationHelper

	def link_to_admin_level(*args)
		if current_user && current_user.admin?
			link_to(*args)
		end
	end

	def link_to_admin_and_owner(user, *args)
		if user_signed_in? && (user == current_user || current_user.admin?)
			link_to(*args)
		end
	end

	def link_to_signed_in (*args)
		if user_signed_in?
			link_to(*args)
		end
	end
	
end
