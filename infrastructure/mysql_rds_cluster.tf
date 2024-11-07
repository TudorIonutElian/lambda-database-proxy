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
  storage_encrypted       = true
  apply_immediately       = true
  iam_database_authentication_enabled = true
  
  tags = {
    Name = "mysql-cluster"
  }
}

/* add a rds instance cluster to the cluster*/

resource "aws_rds_cluster_instance" "mysql_instance" {
  count = 2
  cluster_identifier = aws_rds_cluster.mysql.id
  instance_class = "db.t3.medium"
  engine = "aurora-mysql"
  identifier = "mysql-instance-${count.index}"
  apply_immediately = true
  tags = {
    Name = "mysql-instance-${count.index}"
  }
}