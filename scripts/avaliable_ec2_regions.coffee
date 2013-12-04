REGIONS_LIST_URL = 'http://docs.aws.amazon.com/general/latest/gr/rande.html'

request = require('request')
jsdom = require('jsdom')

AWSServiceRegions = require('aws/service_regions')

request REGIONS_LIST_URL, (error, response, body) ->
  jsdom.env body, [], (errors, window) ->
    awsServiceRegions = new AWSServiceRegions('Amazon EC2')
    regions = awsServiceRegions.parse(window.document.body)

    console.log JSON.stringify(regions)
