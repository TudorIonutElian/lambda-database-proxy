// add an mysql_rds_cluster

resource "aws_rds_cluster" "mysql" {
  cluster_identifier      = "mysql-cluster"
  engine                  = "aurora-mysql"
  engine_version          = "8.0.mysql_aurora.3.04.3"
  database_name           = "mydb"
  master_username         = "admin"
  master_password         = "password"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.lambda_database_proxy_mysql_sg.id]
  db_subnet_group_name    = aws_db_subnet_group.lambda_database_proxy_subnet_group.name
  storage_encrypted       = true
  apply_immediately       = true
  tags = {
    Name = "mysql-cluster"
  }
}