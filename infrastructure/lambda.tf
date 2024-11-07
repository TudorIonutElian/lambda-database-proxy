resource "aws_lambda_function" "lambda_database_proxy_function" {
  filename         = data.archive_file.lambda_database_proxy_archive.output_path
  source_code_hash = data.archive_file.lambda_database_proxy_archive.output_base64sha256
  function_name    = "lambda-database-proxy-func"
  role             = aws_iam_role.lambda_database_proxy_role.arn
  handler          = "index.handler"
  runtime          = "nodejs20.x"
  depends_on       = [data.archive_file.lambda_database_proxy_archive]

  tags = {
    Name    = "lambda-database-proxy-func"
    Project = "lambda-database-proxy"
  }

  vpc_config {
    subnet_ids         = [aws_subnet.lambda_database_proxy_subnet[0].id, aws_subnet.lambda_database_proxy_subnet[1].id]
    security_group_ids = [aws_security_group.lambda_sg.id]
  }

}