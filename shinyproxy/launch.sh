#!/bin/sh


# Subnets
sub_a=subnet-5569971c
sub_b=subnet-50448f37
sub_c=subnet-ca52658c

# Security group ids:
only_ssh=sg-02fb2cce133f18075

# Some instance types:
# t2.micro
# t2.small
# t2.medium
# t3.micro / small medium
# m5.xlarge

latest_ami=$(aws ec2 describe-images  --filters Name=name,Values="ubuntu/images/hvm-ssd/ubuntu-bionic-18.04*" --query 'Images[*].[ImageId]' --output text | sort -k2 -r | head -n1) 



aws ec2 run-instances \
    --image-id  $latest_ami \
    --key gerber_macbook \
    --block-device-mapping DeviceName=/dev/sda1,Ebs={VolumeSize=40} \
    --region ap-southeast-1 \
    --subnet-id $sub_c \
    --security-group-ids $only_ssh \
    --instance-type t2.medium \
    --user-data file://cloudinit.txt \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=generic},{Key=owner,Value=lorenz},{Key=type,Value=generic}]'
