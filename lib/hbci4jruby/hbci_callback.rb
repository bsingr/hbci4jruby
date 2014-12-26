module Hbci4Jruby
  class HBCICallback < AbstractHBCICallback
    @@status_names = {}
    constants.each { |c| @@status_names[const_get(c)] = c }

    def build_answer banking_passport
      answer = {}
      answer[NEED_PT_PIN]     = banking_passport.pin
      answer[NEED_CUSTOMERID] = banking_passport.customer_id
      answer[NEED_USERID]     = banking_passport.user_id
      answer[NEED_COUNTRY]    = banking_passport.country_code
      answer[NEED_BLZ]        = banking_passport.bank_number
      answer[NEED_FILTER]     = banking_passport.filter
      answer[NEED_HOST]       = banking_passport.host
      answer[NEED_PORT]       = banking_passport.port
      answer
    end

    def callback(passport, reason, msg, dataType, retData)
      banking_passport = passport.getClientData('init')

      # for reason enum definitions see HBCICallback.java in hbci4java
      answer = build_answer(banking_passport)[reason]
      if answer
        retData.replace(0, retData.length, answer)
      else
        case reason
          when NEED_PASSPHRASE_LOAD then retData.replace(0, retData.length, passphrase)
          when NEED_PASSPHRASE_SAVE then retData.replace(0, retData.length, "foo")
          when NEED_PT_PIN then retData.replace(0, retData.length, pin)
          when NEED_PT_TAN then retData.replace(0, retData.length, tan)
          when NEED_CONNECTION, CLOSE_CONNECTION then nil
          else puts "not implemented #{reason}"
        end
      end
    end

    def log(msg, level, date, trace)
      #puts msg
    end

    def status(passport, statusTag, o)
      #puts @@status_names[statusTag]
    end
  end
end
