#!/bin/sh

aws ec2 run-instances --image-id ami-1c6627f6 --key gerber --security-group-ids sg-b8b318c0 --subnet subnet-6c9f8d2a --iam-instance-profile Name=docker-reg --instance-type t2.small --block-device-mapping 'DeviceName=/dev/sda1,Ebs={VolumeSize=20}' --user-data file://cloudinit.txt --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=pbs},{Key=owner,Value=lorenz},{Key=type,Value=pbs}]'
