#!/bin/sh

aws ec2 run-instances --image-id  ami-a59b49c6 --key gerber --block-device-mapping DeviceName=/dev/xvda,Ebs={VolumeSize=40} --subnet subnet-6c9f8d2a --iam-instance-profile Name=docker-reg --subnet-id subnet-6c9f8d2a --instance-type t2.micro --user-data file://cloudinit.txt --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=beacon},{Key=owner,Value=lorenz},{Key=type,Value=beacon}]'
