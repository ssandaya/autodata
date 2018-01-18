require "watir"
puts "PenDragonSoftwareVersionDownload"
browser = Watir::Browser.new :chrome
browser.goto "http://pendragon.sim.gilbarco.com/"

browser.select_list(:name, "partfile").select_value /v33140/
sleep 5
browser.radio(:value,"tar" ).wait_until(&:present?).set
sleep 5
browser.button(:text, "Process file").wait_until(&:present?).click
sleep 5
browser.td(:text => "Download:").wait_until_present(timeout: 900)
sleep 5
browser.a(:href,/thumb/).wait_until_present(timeout: 10).click
sleep 5
#browser.a(:href,/thumb/).
sleep 500

browser.close
