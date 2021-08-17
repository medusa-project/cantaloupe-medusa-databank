require 'net/http'
require 'logger'
require 'json'
require 'nokogiri'

logger = Logger.new('/home/iiif/log/health-checks/health_check_status.log', 1, 500000)

instance_id = File.open('/var/lib/cloud/data/instance-id', &:readline).strip    

databank_uri = URI('https://demo.iiif.library.illinois.edu/databank/health')
databank_response = Net::HTTP.get_response(databank_uri)

begin
    databank_color = JSON.parse(databank_response.body)['color']
    databank_message = JSON.parse(databank_response.body)['message']
    databank_response_body = {"databank_color" => databank_color, "databank_message" => databank_message}

    databank_log = {"InstanceId" => instance_id, "databank_code" => databank_response.code, "databank_message" => databank_response_body}
rescue JSON::ParserError => e
    databank_response_HTML = Nokogiri::HTML.parse(databank_response.body)
    databank_log = {"instance_id" => instance_id, "databank_code" => databank_response.code, "databank_message" => databank_response_HTML.title}
end   

logger.info(databank_log.to_json)


medusa_uri = URI('https://demo.iiif.library.illinois.edu/medusa/health')
medusa_response = Net::HTTP.get_response(medusa_uri)

begin
    medusa_color = JSON.parse(medusa_response.body)['color']
    medusa_message = JSON.parse(medusa_response.body)['message']
    medusa_response_body = {"medusa_color" => medusa_color, "medusa_message" => medusa_message}

    medusa_log = {"InstanceId" => instance_id, "medusa_code" => medusa_response.code, "medusa_message" => medusa_response_body}
rescue JSON::ParserError => e
    medusa_response_HTML = Nokogiri::HTML.parse(medusa_response.body)
    medusa_log = {"instance_id" => instance_id, "medusa_code" => medusa_response.code, "medusa_message" => medusa_response_HTML.title}
end 

logger.info(medusa_log.to_json)
