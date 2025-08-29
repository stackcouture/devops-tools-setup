output "sg_id" {
  value = aws_security_group.jenkins_sg.id
}

output "artifact_sg_id" {
  value = aws_security_group.artifact_analysis_sg.id
}

output "bastion_sg_id" {
  value = aws_security_group.bastion_sg.id
}