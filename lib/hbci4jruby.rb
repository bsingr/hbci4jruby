require 'java'
require File.join(File.dirname(__FILE__),'hbci4java.jar')

import 'org.kapott.hbci.manager.HBCIUtils'
import 'org.kapott.hbci.manager.HBCIUtilsInternal'
import 'org.kapott.hbci.passport.AbstractHBCIPassport'
import 'org.kapott.hbci.callback.AbstractHBCICallback'
import 'org.kapott.hbci.manager.HBCIHandler'

require File.join(File.dirname(__FILE__), 'hbci4jruby', 'banking_passport')
require File.join(File.dirname(__FILE__), 'hbci4jruby', 'hbci_callback')
require File.join(File.dirname(__FILE__), 'hbci4jruby', 'turnover')

HBCIUtils.init(nil, Hbci4Jruby::HBCICallback.new)
HBCIUtils.setParam("client.product.name","HBCI4Java")
HBCIUtils.setParam("client.product.version","2.5")
HBCIUtils.setParam("client.passport.default","PinTan")
HBCIUtils.setParam("client.retries.passphrase","2")
# client.passport.PinTan.certfile=hbcicerts.bin
HBCIUtils.setParam("client.passport.PinTan.checkcert","1")
HBCIUtils.setParam("client.passport.PinTan.init","1")
HBCIUtils.setParam("client.passport.PinTan.filename", 'pintan.dat')

module Hbci4Jruby
end
