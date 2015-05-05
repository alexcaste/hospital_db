require("rspec")
require("pg")
require("patient")
require('doctor')
require('pry')

DB = PG.connect({:dbname => 'hospital_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM specialties *;")
  end
end
