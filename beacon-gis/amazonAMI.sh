#!/bin/sh

aws ec2 run-instances \
    --profile default \
    --image-id  ami-a59b49c6 \
    --key gerber \
    --block-device-mapping DeviceName=/dev/xvda,Ebs={VolumeSize=40} \
    --subnet-id subnet-6c9f8d2a\
    --security-group-ids  sg-09f1cf4bbbc408158\
    --iam-instance-profile Name=beacon_data_s3 \
    --instance-type t2.micro \
    --user-data file://cloudinit.txt \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=beacon-gis},{Key=owner,Value=lorenz},{Key=type,Value=beacon-ui}]'
