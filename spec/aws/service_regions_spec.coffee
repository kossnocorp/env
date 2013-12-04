AWSServiceRegions = require('aws/service_regions')

describe 'AWSServiceRegions', ->

  beforeEach ->
    @awsServiceRegions = new AWSServiceRegions('Amazon CloudSearch')
    @$regionsAndEndpoints = $(window.__html__['spec/fixtures/aws/regions_and_endpoints.html'])

  describe '::parse', ->

    it 'returns list of avaliable regions by service name', ->
      result = @awsServiceRegions.parse(@$regionsAndEndpoints[0])

      expect(result).to.be.eql [
        {
          name: 'US East (Northern Virginia) Region',
          id: 'us-east-1',
          endpoint: 'cloudsearch.us-east-1.amazonaws.com',
          protocols: {
            http: false,
            https: true
          }
        },
        {
          name: 'US West (Northern California) Region',
          id: 'us-west-1',
          endpoint: 'cloudsearch.us-west-1.amazonaws.com',
          protocols: {
            http: false,
            https: true
          }
        },
        {
          name: 'US West (Oregon) Region',
          id: 'us-west-2',
          endpoint: 'cloudsearch.us-west-2.amazonaws.com',
          protocols: {
            http: false,
            https: true
          }
        },
        {
          name: 'EU (Ireland) Region',
          id: 'eu-west-1',
          endpoint: 'cloudsearch.eu-west-1.amazonaws.com',
          protocols: {
            http: false,
            https: true
          }
        },
        {
          name: 'Asia Pacific (Singapore) Region',
          id: 'ap-southeast-1',
          endpoint: 'cloudsearch.ap-southeast-1.amazonaws.com',
          protocols: {
            http: false,
            https: true
          }
        }
      ]

  describe '::parseServiceId', ->

    it 'returns service id for given name', ->
      result = @awsServiceRegions.parseServiceId(@$regionsAndEndpoints[0])
      expect(result).to.be.eq 'cloudsearch'

