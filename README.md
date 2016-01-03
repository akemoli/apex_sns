# apex_sns
sample for aws sns publishing with apex.

# usage

```apex
SNSClient client = new SNSClient(
  'input your aws access key id',
  'input your aws secret access key',
  'input your region'
);

String response = client.publish(new Map<String, String> {
  'Message' => 'message',
  'TopicArn' => 'Topic ARN'
});
```
