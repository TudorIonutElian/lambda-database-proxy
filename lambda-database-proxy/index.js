// Use 'import' instead of 'require'
const { CloudWatchClient, PutMetricDataCommand } = require('@aws-sdk/client-cloudwatch');
const cloudwatch = new CloudWatchClient();

module.exports.handler = async (event) => {
    console.log('Received event:', JSON.stringify(event, null, 2));
};