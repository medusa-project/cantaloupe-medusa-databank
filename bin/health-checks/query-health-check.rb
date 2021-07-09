require 'net/http'
require 'logger'

HTTP_GREEN_STATUS = '200'
logger = Logger.new('/home/iiif/log/health-checks/health_check_status.log', 1, 500000)

databank_uri = URI('https://demo.iiif.library.illinois.edu/databank/health')
databank_response = Net::HTTP.get_response(databank_uri)

if databank_response.code == HTTP_GREEN_STATUS
    logger.debug("Databank HTTP Code #{databank_response.code} with message #{databank_response.body}")
else
    logger.error("Databank HTTP Code #{databank_response.code} with message #{databank_response.body}")
end


medusa_uri = URI('https://demo.iiif.library.illinois.edu/medusa/health')
medusa_response = Net::HTTP.get_response(medusa_uri)

if medusa_response.code == HTTP_GREEN_STATUS
    logger.debug("Medusa HTTP Code #{medusa_response.code} with message #{medusa_response.body}")
else
    logger.error("Medusa HTTP Code #{medusa_response.code} with message #{medusa_response.body}")
end
