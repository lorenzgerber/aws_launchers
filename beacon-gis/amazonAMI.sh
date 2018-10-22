#!/bin/sh

aws ec2 run-instances --profile ronin --image-id  ami-a59b49c6 --key gerber_ronin --block-device-mapping DeviceName=/dev/xvda,Ebs={VolumeSize=40} --subnet-id subnet-74929f32 --security-group-ids sg-05a6ccdd413451301 --iam-instance-profile Name=beacon --instance-type t2.micro --user-data file://cloudinit.txt --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=beacon-gis},{Key=owner,Value=lorenz},{Key=type,Value=beacon-ui}]'
