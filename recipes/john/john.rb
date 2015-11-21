Cauldron.configure do
  name "john"

  install do
    package_install "john"
  end
  
  is_removed do
    not(exists "/etc/cron.d/john") &&
    not(exists "/etc/cron.daily/john") &&
    not(exists "/usr/bin/john") &&
    not(in_path "john") &&
    not(is_running "john")
  end
  
  remove do
    package_purge "john"
  end

end
