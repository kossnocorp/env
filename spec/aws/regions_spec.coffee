AWSRegions = require('aws/regions')

describe 'AWSRegions', ->

  beforeEach ->
    @$regionsTable = $(window.__html__['spec/fixtures/aws/regions.html'])
    @$region = $(window.__html__['spec/fixtures/aws/region.html'])
    @awsRegions = new AWSRegions()

  describe '::parse', ->
    it 'returns regions map for table html', ->
      map = @awsRegions.parse(@$regionsTable[0])
      expect(map).to.be.eql [
        {
          name: 'US East (Northern Virginia) Region',
          id: 'us-east-1',
          endpoint: 'ec2.us-east-1.amazonaws.com',
          protocols: {
            http: true,
            https: false
          }
        },
        {
          name: 'US West (Oregon) Region',
          id: 'us-west-2',
          endpoint: 'ec2.us-west-2.amazonaws.com',
          protocols: {
            http: false,
            https: true
          }
        },
        {
          name: 'US West (Northern California) Region',
          id: 'us-west-1',
          endpoint: 'ec2.us-west-1.amazonaws.com',
          protocols: {
            http: true,
            https: true
          }
        }
      ]

  describe '::parseRegion', ->

    it 'returns region object', ->
      result = @awsRegions.parseRegion(@$region[0])
      expect(result).to.be.eql {
        name: 'US East (Northern Virginia) Region',
        id: 'us-east-1',
        endpoint: 'ec2.us-east-1.amazonaws.com',
        protocols: {
          http: true,
          https: false
        }
      }

  describe '::parseProtocols', ->

    it 'returns {http: true, https: false} for "HTTP"', ->
      expect(@awsRegions.parseProtocols('HTTP')).to.be.eql {http: true, https: false}

    it 'returns {http: false, https: true} for "HTTPS"', ->
      expect(@awsRegions.parseProtocols('HTTPS')).to.be.eql {http: false, https: true}

    it 'returns {http: true, https: true} for "HTTP and HTTPS"', ->
      expect(@awsRegions.parseProtocols('HTTP and HTTPS')).to.be.eql {http: true, https: true}
