class Script < ApplicationRecord
	mount_uploader :input_file, InputFileUploader
	after_create :create_output_directory

	def create_output_directory
		Dir.mkdir("#{Rails.root}/script_files/#{name.underscore}") unless File.directory?(name.underscore)
		Dir.mkdir("#{Rails.root}/script_files/#{name.underscore}/output_files")
	end
end