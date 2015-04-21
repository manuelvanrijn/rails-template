# Returns the tag name or the hash of the commit
Rails.application.config.version = begin
  `git describe --always --tag 2> /dev/null`.chomp
rescue
  'N/A'
end

# Returns the time of the last commit or the boot time of the application
Rails.application.config.version_time = begin
  time = Time.zone.parse(`git log -1 --format="%ad" --date=iso 2> /dev/null`)
  fail if time.nil?
  time
rescue
  Time.zone.now
end
