$ = window?.$ or require('jquery')

class AWSRegions

  parse: (regionsTable) ->
    $table = $(regionsTable)
    $regionsRows = $table.find('tbody tr')

    $regionsRows.map((i, row) => @parseRegion(row)).toArray()

  parseRegion: (region) ->
    $region = $(region)
    $tds = $region.find('td')

    regionData = $tds.map((i, td) -> $td = $(td).text()).toArray()
    name = regionData[0]
    id = regionData[1]
    endpoint = regionData[2]
    protocolsString = regionData[3]
    protocols = @parseProtocols(protocolsString)

    {name, id, endpoint, protocols}

  parseProtocols: (protocolsString) ->
    switch protocolsString
      when 'HTTPS'
        http: false, https: true
      when 'HTTP'
        http: true, https: false
      when 'HTTP and HTTPS'
        http: true, https: true

if modula?
  modula.export('aws/regions', AWSRegions)
else if module?
  module.exports = AWSRegions
else
  window.AWSRegions = AWSRegions
