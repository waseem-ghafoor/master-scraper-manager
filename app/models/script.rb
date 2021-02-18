class Script < ApplicationRecord
	mount_uploader :input_file, InputFileUploader
	after_create :create_output_directory
	validates :name, presence: true, uniqueness: true

	validate :future_time

	def create_output_directory
		Dir.mkdir("#{Rails.root}/script_files/#{name.underscore}") unless File.directory?(name.underscore)
		Dir.mkdir("#{Rails.root}/script_files/#{name.underscore}/output_files")
	end

	def future_time
		p self.scheduler
		# if self.scheduler <= Time.now
		# 	self.errors.add(:scheduler, "Time should in future")
		# end
	end
end