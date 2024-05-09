/*
    Policy to allow viewing S3 buckets and read/write
    access to the xyz-media bucket
*/

# Resource: s3_access_policy
resource "aws_iam_policy" "s3_access_policy" {
    name = "s3-access-policy"
    description = "Policy to allow viewing S3 buckets and read/write access to the xyz-media bucket"

    policy = jsonencode({
        Version: "2012-10-17"
        Statement = [
            {
                Effect = "Allow",
                Action = [
                    "s3:ListAllMyBuckets",
                    "s3:ListBucket",
                    "s3:GetBucketLocation",
                ],
                Resource = [
                    "arn:aws:s3:::*"
                ]
            },
            {
                Effect = "Allow",
                Action = [
                    "s3:GetObject",
                    "s3:PutObject",
                    "s3:DeleteObject"
                ],
                Resource = [
                    "arn:aws:s3:::xyz-media",
                    "arn:aws:s3:::xyz-media/*"
                ]
            }
        ]
    })
}
