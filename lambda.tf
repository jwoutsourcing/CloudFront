resource "aws_lambda_function" "insert-mysql" {
  # The bucket name as created earlier with "aws s3api create-bucket"
  function_name = "insert-mysql"
  s3_bucket     = "steve-wood-wwww-bucket"
  s3_key        = "v1.0.0/node.zip"

  handler = "main.handler"
  runtime = "nodejs6.10"

  role = "${aws_iam_role.lambda_exec.arn}"
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda-exec"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
