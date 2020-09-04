#!/bin/bash
#这是一个获取临时角色的脚本
 case $1 in

    "--profile")
      shift
      AWS_OPS="--profile $1"
      ;;

    "--setup")
      while [ "$2" != "" ]; do
        case $2 in
          "-p")
            ASSUME_ROLE_ARN=${PRD_ASSUME_ROLE_ARN}
            ;;
          "-d")
            ASSUME_ROLE_ARN=${PREPRD_ASSUME_ROLE_ARN}
            ;;
          "-r")
            ASSUME_ROLE_ARN=${RELENG_ASSUME_ROLE_ARN}
            ;;
          * )
            "usage"
            exit 1
            ;;
setup () {
  raw_output=$(aws sts $AWS_OPS \
  assume-role --role-arn $ASSUME_ROLE_ARN \
  --role-session-name $SESSION_NAME)

  aws_key_id=$(echo $raw_output | jq .Credentials.AccessKeyId)
  aws_secret_key=$(echo $raw_output | jq .Credentials.SecretAccessKey)
  session_token=$(echo $raw_output | jq .Credentials.SessionToken)

  echo "export AWS_ACCESS_KEY_ID=$aws_key_id"
  echo "export AWS_SECRET_ACCESS_KEY=$aws_secret_key"
  echo "export AWS_SESSION_TOKEN=$session_token"

}

aws sts $AWS_OPS \
assume-role --role-arn $ASSUME_ROLE_ARN \
--role-session-name $SESSION_NAME 
获取key


aws_secret_key=$(echo $raw_output | jq .Credentials.SecretAccessKey)
session_token=$(echo $raw_output | jq .Credentials.SessionToken)

jq 命令处理


然后输出


变量全都替换后成这样:
ws sts assume-role --role-arn arn:aws-cn:iam::012946955706:role/userassume-sa-prod-admin --role-session-name Devops

