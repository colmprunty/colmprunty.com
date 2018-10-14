resource "aws_ecs_cluster" "everything-cluster" {
  name = "everything-cluster"
}

resource "aws_ecs_service" "colmprunty-com" {
  name            = "colmprunty-com"
  cluster         = "${aws_ecs_cluster.everything-cluster.id}"
  task_definition = "${aws_ecs_task_definition.colmprunty.arn}"
  desired_count   = 1

  #iam_role        = "${aws_iam_role.ecs-service-role.name}"
  #depends_on      = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceRole"

  service_registries {
    registry_arn   = "${aws_service_discovery_service.colmprunty-sd.arn}"
    container_port           = 5000
    container_name = "colmprunty-com"
  }
}

resource "aws_service_discovery_service" "colmprunty-sd" {
  name = "colmprunty-sd"

  dns_config {
    namespace_id = "${aws_service_discovery_public_dns_namespace.colmprunty-com.id}"

    dns_records {
      ttl  = 10
      type = "SRV"
    }
  }

  # health_check_config {
  #   failure_threshold = 10
  #   resource_path = "path"
  #   type = "HTTP"
  # }
}

resource "aws_service_discovery_public_dns_namespace" "colmprunty-com" {
  name        = "aws.colmprunty.com"
  description = "service discovery dns"
}
