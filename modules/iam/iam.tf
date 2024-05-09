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


/*
    Policy to grant administrative access to all resources and
    read-only access to IAM, with specific actions allowed on
    own IAM user
*/
# Resource: administrative-access-policy
resource "aws_iam_policy" "administrative-access-policy" {
    name = "administrative-access-policy"
    description = "Policy to grant administrative access to all resources and read-only access to IAM, with specific actions allowed on own IAM user"

    policy = jsonencode({
        Version: "2012-10-17"
        Statement = [
            {
                Effect = "Allow",
                NotAction = "iam:*"
                Resource = "*"
            },
            {
                Effect = "Allow",
                Action = [
                    "iam:Get*",
                    "iam:List*",
                    "iam:Generate*"
                ],
                Resource = "*"
            },
            {
                Effect = "Allow",
                Action = [
                    "iam:ChangePassword",
                    "iam:UpdateLoginProfile",
                    "iam:ListVirtualMFADevices",
                    "iam:CreateVirtualMFADevice",
                    "iam:EnableMFADevice",
                    "iam:GetMFADevice",
                    "iam:ListMFADevices",
                    "iam:ResyncMFADevice",
                    "iam:DeactivateMFADevice",
                    "iam:CreateAccessKey",
                    "iam:UpdateAccessKey",
                    "iam:DeleteAccessKey",
                    "iam:TagUser"
                ],
                Resource = "arn:aws:iam::*:user/$${aws:username}"
            }
        ]
    })
}