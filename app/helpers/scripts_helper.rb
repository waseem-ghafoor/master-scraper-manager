module ScriptsHelper
	def file_name(file_link)
		file_link.split('/').last
	end

	def send_smart_path(file_link)
		file_link.split('script_files/').last
	end

	def file_links(name)
		Dir.glob("#{Rails.root}/script_files/#{name.underscore}/output_files/*")
	end
	
	def input_file_links(name)
		Dir.glob("#{Rails.root}/script_files/#{name.underscore}/input_file/*")
	end
end
