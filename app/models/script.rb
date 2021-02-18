class Script < ApplicationRecord
	mount_uploaders :input_file, InputFileUploader
	serialize :input_file, JSON
	validates :name, presence: true, uniqueness: true
	validate :future_time
	after_create :create_output_directory
	after_save :set_script_running_time



	def create_output_directory
		Dir.mkdir("#{Rails.root}/script_files/#{name.underscore}") unless File.directory?(name.underscore)
		Dir.mkdir("#{Rails.root}/script_files/#{name.underscore}/output_files")
	end

	def future_time
		#p self.scheduler
		if self.schedule <= Time.now
			self.errors.add(:schedule, "Time should in future")
		end
	end

	def set_script_running_time
		p "job running"
		Delayed::Job.where(script_name: name).delete_all
		Script.delay(run_at: Time.now + 10.seconds, script_name: name).start_script('') if schedule.present? && schedule > Time.now
		p "Job stop"
	end

	def self.start_script(script_files)
		sleep 5
		system("ls #{Rails.root}")
	end
end