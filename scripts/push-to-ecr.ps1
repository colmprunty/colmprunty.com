$ErrorActionPreference = 'Stop'

$DockerImageName = ""
$DockerRepoUrl = ""

Write-Host "Running aws login"
Invoke-Expression -Command (aws ecr get-login --no-include-email --region eu-west-1)

docker tag $DockerImageName $DockerRepoUrl

Write-Host "Pushing to $DockerRepoUrl"
docker push $DockerRepoUrl

Write-Host "Removing image $DockerRepoUrl"
docker rmi $DockerRepoUrl