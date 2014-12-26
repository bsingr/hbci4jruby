module Hbci4Jruby
  class BankingPassport
    attr_accessor :hbci_version, :pin, :user_id, :customer_id,
                  :country_code, :port, :host, :filter,
                  :bank_number, :account_number

    def attributes= hash
      self.hbci_version    = hash['hbci_version']
      self.pin             = hash['pin']
      self.user_id         = hash['user_id']
      self.customer_id     = hash['customer_id']
      self.country_code    = hash['country_code']
      self.port            = hash['port']
      self.host            = hash['host']
      self.filter          = hash['filter']
      self.bank_number     = hash['bank_number']
      self.account_number  = hash['account_number']
    end
  end
end
