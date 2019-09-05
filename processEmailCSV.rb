#!/opt/chefdk/embedded/bin/ruby

require 'csv'
columns = ['username', 'firstname', 'lastname', 'org', 'changepassword']
CSV.open('/Users/cramerm/Desktop/emailAddr.csv', 'wb') do |csv|
  CSV.foreach('/Users/cramerm/GitHub/OSX-manage/extract4.csv', :headers=>true) do |row|
    csv << columns.map { |col| row[col] }
  end
end
