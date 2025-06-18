resource "aws_security_group" "efs_nfs" {
  name        = format("efs-%s",var.share_name)
  description = "Allow NFS inbound traffic"
  vpc_id      = var.vpc_id
  tags = var.tags

  ingress {
    description = "NFS from VPC"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = var.cidr_access_from
  }
}

resource "aws_efs_file_system" "aws_efs" {
  creation_token = var.share_name
  encrypted = true
# throughput_mode = elastic
  tags = var.tags
}


resource "aws_efs_mount_target" "efs_mount" {
    for_each = toset(var.subnet_ids)
    file_system_id = aws_efs_file_system.aws_efs.id
    subnet_id = each.value
    security_groups = [aws_security_group.efs_nfs.id]

}   


resource "aws_efs_access_point" "efs_app" {
  file_system_id = aws_efs_file_system.aws_efs.id
  posix_user {
    uid = var.uid
    gid = var.gid
  }
  root_directory {
    path = format("/%s",var.path)
    creation_info {
      owner_uid = var.uid
      owner_gid = var.gid
      permissions = var.permissions    
    }
  }
  tags = var.tags
}