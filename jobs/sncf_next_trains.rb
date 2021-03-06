require 'open-uri'

SCHEDULER.every '15s', :first_in => 0 do |job|
  response = Net::HTTP.get_response("www.gares-sncf.com", "/fr/train-times/departure/RRD/gl")
  if response.code == "200"
    if response.body != '""'
      result = JSON.parse(response.body)
      trains = result["trains"]
      send_event("sncf_next_trains", {sncf_next_trains: trains[0..8]})
    else
      send_event("sncf_next_trains", {sncf_net_trains: []})
    end
  else
    puts "SNCF ERROR"
  end
end
