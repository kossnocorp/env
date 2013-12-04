$ = window?.$ or require('jquery')

class AWSServices

  parse: (body) ->
    map = {}

    $body = $(body)
    $topics = $body.find(':contains(Topics)')
    $container = $topics.closest('.highlights')
    $ul = $container.find('ul')
    $lis = $ul.find('li')

    $lis.each (i, li) =>
      if service = @parseService(li)
        [id, name] = service
        map[id] = name

    map

  parseService: (li) ->
    $li = $(li)
    $a = $li.find('a')
    name = $a.text()
    id = @parseId($a.attr('href'))

    if id then [id, name] else null

  parseId: (url) ->
    matches = url.match(/#(.+)(?=_region)/)
    if matches then matches[1] else null

if modula?
  modula.export('aws/services', AWSServices)
else if module?
  module.exports = AWSServices
else
  window.AWSServices = AWSServices
