# Rotates development and test log files when they exceed 20 MB.
# In production use a more robust system like /etc/logrotate.d/.
#
if Rails.env.development? || Rails.env.test?
  Dir.glob(Rails.root.join('log', '*.log')).each do |log_file|
    next if File.size(log_file) < 20_000_000

    File.delete "#{log_file}.1" if File.exist?("#{log_file}.1")
    FileUtils.cp(log_file, "#{log_file}.1")
    File.truncate(log_file, 0)
  end
end
