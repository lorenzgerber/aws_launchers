#!/bin/sh


# Subnets
sub_a=subnet-1760e573
sub_b=subnet-861ca8f0
sub_c=subnet-6c9f8d2a

# Security group ids:
ssh_and_web=sg-09f1cf4bbbc408158
only_ssh=sg-0c341a85d70187c3e

# Some instance types:
# t2.micro
# t2.small
# t2.medium
# t3.micro / small medium
# m5.xlarge

latest_ami=$(aws ssm get-parameters --names /aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2 --region ap-southeast-1 --query 'Parameters[0].[Value]' --output text) 

aws ec2 run-instances \
    --image-id  $latest_ami \
    --key gerber \
    --block-device-mapping DeviceName=/dev/xvda,Ebs={VolumeSize=40} \
    --subnet-id $sub_c \
    --security-group-ids $only_ssh \
    --iam-instance-profile Name=gerber \
    --instance-type t2.medium \
    --user-data file://cloudinit.txt \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=generic},{Key=owner,Value=lorenz},{Key=type,Value=generic}]'
