require File.join(File.dirname(__FILE__), '..', 'lib', 'hbci')

include Hbci4Jruby

banking_passport = BankingPassport.new
banking_passport.hbci_version    = '300'
banking_passport.host            = 'fints.comdirect.de/fints'
banking_passport.port            = '443'
banking_passport.filter          = 'Base64'
banking_passport.country_code    = 'DE'
banking_passport.bank_number     = 'xx'
banking_passport.customer_id     = 'xx'
banking_passport.user_id         = 'xx'
banking_passport.account_number  = 'xx'
banking_passport.pin             = 'xx'

$r = Turnover.new.list(banking_passport, {
  'start_date' => Time.new(2013),
  'end_date'   => Time.now
})
p $r[0].to_string

#require 'irb'
#IRB.start
