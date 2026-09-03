output "vm_aws_public_ip" {
  description = "Public IP of the AWS VM"
  value       = aws_instance.vm.public_ip
}