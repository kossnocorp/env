$ = window?.$ or require('jquery')

AWSServices = require('aws/services')
AWSRegions = require('aws/regions')

class AWSServiceRegions

  constructor: (@serviceName) ->

  parse: (body) ->
    awsRegions = new AWSRegions()
    id = @parseServiceId(body)

    $body = $(body)
    $title = $body.find("##{id}_region")
    $section = $title.closest('.section')
    $table = $section.find('.informaltable table')

    awsRegions.parse($table[0])

  parseServiceId: (body) ->
    awsServices = new AWSServices()
    services = awsServices.parse(body)
    for id, name of services
      return id if name is @serviceName

if modula?
  modula.export('aws/service_regions', AWSServiceRegions)
else if module?
  module.exports = AWSServiceRegions
else
  window.AWSServiceRegions = AWSServiceRegions
