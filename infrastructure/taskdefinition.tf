resource "aws_ecs_task_definition" "colmprunty" {
  family                = "colmprunty"
  container_definitions = "${file("./taskdefinition.json")}"
  network_mode          = "bridge"
}
