class Script < ApplicationRecord
	mount_uploader :input_file, InputFileUploader

	def create_output_directory
		
	end
end