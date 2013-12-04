AWSServices = require('aws/services')

describe 'AWSServices', ->

  beforeEach ->
    @awsServices = new AWSServices()

  describe '::parse', ->

    it 'returns services map', ->
      services = $(window.__html__['spec/fixtures/aws/services.html'])
      result = @awsServices.parse(services[0])
      expect(result).to.be.eql {
        cf: 'Amazon CloudFront'
        ec2: 'Amazon EC2'
        s3: 'Amazon Simple Storage Service (S3)'
      }

  describe '::parseService', ->

    it 'return array with service id and name', ->
      $service = $(window.__html__['spec/fixtures/aws/service.html'])
      result = @awsServices.parseService($service[0])
      expect(result).to.be.eql ['cf', 'Amazon CloudFront']

    it 'returns null if id is not found', ->
      $service = $(window.__html__['spec/fixtures/aws/spoilt_service.html'])
      result = @awsServices.parseService($service[0])
      expect(result).to.be.null

  describe '::parseId', ->

    it 'returns id by given url', ->
      result = @awsServices.parseId('http://docs.aws.amazon.com/general/latest/gr/rande.html#cf_region')
      expect(result).to.be.eq 'cf'

    it 'return null if url is not valid', ->
      result = @awsServices.parseId('spoilt url')
      expect(result).to.be.null

