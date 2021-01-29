module DownloadFile
  def script_output_download file_link
		send_file("#{Rails.root}/script_files/#{file_link}")
	end
end