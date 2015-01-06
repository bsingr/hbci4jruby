require 'date'

module Hbci4jruby
  class Turnover
    # Umsätze von start_date bis end_date abrufen
    # * passport_type, passphrase, pin und file kommen in dieser Implementation aus der zugrunde liegenden Tabelle.
    # * Wenn passport_type = "PinTan" ist, wird die pin verwendet.
    # * Wenn passport_type = "RDHNew" ist, wird die Schlüsseldatei aus filename verwendet und mit der passphrase entschlüsselt.
    def list(banking_passport, params)
      passport = AbstractHBCIPassport.getInstance('PinTan', banking_passport)
      handle = HBCIHandler.new(banking_passport.hbci_version, passport)
      job = handle.newJob('KUmsAll')
      my_account = passport.getAccount(banking_passport.account_number)

      job.setParam('my', my_account)

      ruby_startdate = params['start_date'] || (Date.today - 1)
      job.setParam('startdate', java.util.Date.new(ruby_startdate.year-1900, ruby_startdate.month-1, ruby_startdate.day))

      ruby_enddate = params['end_date'] || (Date.today - 1)
      job.setParam('enddate', java.util.Date.new(ruby_enddate.year-1900, ruby_enddate.month-1, ruby_enddate.day))

      job.addToQueue

      status = handle.execute

      handle.close

      if status.isOK
        result = job.getJobResult
        result.getFlatData.to_a
      else
        puts "Fehler: " + status.getErrorString
      end
    end
  end
end
