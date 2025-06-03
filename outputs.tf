output "vpc-id" {
  value = aws_vpc.main-vpc.id
}

output "ec2-id" {
  value = aws_instance.public_instance.id
}

output "lb-dns" {
  value = aws_lb.app-lb.dns
}