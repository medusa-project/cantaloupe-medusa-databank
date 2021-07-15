require 'net/http'
require 'logger'
require 'json'

HTTP_GREEN_STATUS = '200'
logger = Logger.new('/home/iiif/log/health-checks/health_check_status.log', 1, 500000)

instance_id = File.open('/var/lib/cloud/data/instance-id', &:readline).strip    

databank_uri = URI('https://demo.iiif.library.illinois.edu/databank/health')
databank_response = Net::HTTP.get_response(databank_uri)

databank_log = {"instance_id" => instance_id, "databank_code" => databank_response.code, "databank_message" => databank_response.body}
logger.info(databank_log.to_json)


medusa_uri = URI('https://demo.iiif.library.illinois.edu/medusa/health')
medusa_response = Net::HTTP.get_response(medusa_uri)

medusa_log = {"instance_id" => instance_id, "medusa_code" => medusa_response.code, "medusa_message" => medusa_response.body}
logger.info(medusa_log.to_json)
