module ApplicationHelper
	def show_status status
		case  status
		when 'Not Set'
			css_class = 'badge-info'   
		when 'Scheduled'
		  css_class = 'badge-primary'
		when 'Completed'
			css_class = 'badge-success'
		when 'Running'
			css_class= 'badge-warning'
		else
		  css_class = 'badge-secondary'
		end

		return "<span class='badge #{css_class}'> #{status}</span>".try(:html_safe)
	end
end
