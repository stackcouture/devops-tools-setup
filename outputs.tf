output "jenkins_server_public_ip" {
  value = module.jenkins_server.public_ip
}

output "jenkins_agent_public_ip" {
  value = module.jenkins_agent.public_ip
}

output "artifact_analysis_instnace_public_ip" {
  value = module.artifact_analysis_instnace.public_ip
}

output "bastion_instnace" {
  value = module.bastion_instnace.public_ip
}