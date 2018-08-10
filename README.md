Homepage for `colmprunty.com`

At the moment, the domain is actually pointing at an Azure VM. Yes, an entire virtual machine just for one IIS app. I think it's on .NET 4.5.
The plan for this is to be running on AWS.

- Infrastructure built using [Terraform](https://terraform.io).
- App is built using .NET Core 2.1 and the [React/Redux template](https://docs.microsoft.com/en-us/aspnet/core/client-side/spa/react-with-redux?view=aspnetcore-2.1).
- Running in a [Docker](https://www.docker.com/) container on Linux.
- Running on AWS [Elastic Container Service](https://aws.amazon.com/ecs/)
