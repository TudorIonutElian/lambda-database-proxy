// Create the IAM policy
resource "aws_iam_policy" "lambda_network_interface_policy" {
  name        = "lambda-network-interface-policy"
  description = "IAM policy for Lambda to execute the function"
  policy      = data.aws_iam_policy_document.lambda_network_interface.json
}