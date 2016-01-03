public with sharing class SNSClient extends AWSSigV4Client {
    /**
     * iotdata service name
     */
    private final String SNS_SERVICE = 'sns';
    
    /**
     * @param accessKeyId AWS Access Key ID
     * @param accessKeySecret AWS Access Key Secret.
     * @param region target region.
     */
    public SNSClient(String accessKeyId, String accessKeySecret, String region) {
        super(accessKeyId, accessKeySecret, region);
    }
    
    /**
     * Publish for AWS IoT topic.
     * @param topicName topic name for publish.
     * @return String http response for publish rest api.
     */
    public String publish(
        Map<String, String> params
    ) {
    	params.put('Action', 'Publish');
        List<String> signedHeaders = new List<String>{
            'host', 'x-amz-date'
        };
        
        String resource_path = '/';
        String hostname = 'sns.' + this.region + '.amazonaws.com';
        
        return this.call(
            SNS_SERVICE,
            'POST',
            Utility.getSortedParam(params),
            hostname,
            resource_path,
            signedHeaders,
            new Map<String, String>{},
            'application/x-www-form-urlencoded'
        );
    }
}