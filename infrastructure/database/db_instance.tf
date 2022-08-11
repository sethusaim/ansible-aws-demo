resource "aws_db_instance" "mysql" {
  identifier             = var.identifier
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.mysql_db_name
  username               = var.mysql_username
  password               = var.mysql_password
  parameter_group_name   = var.parameter_group_name
  skip_final_snapshot    = var.skip_final_snapshot
  vpc_security_group_ids = [aws_security_group.security_group.id]
  publicly_accessible    = var.publicly_accessible
}
