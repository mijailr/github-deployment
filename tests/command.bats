#!/usr/bin/env bats

load "$BATS_PATH/load.bash"

@test "Creates a deployment" {
  export BUILDKITE_PLUGIN_GITHUB_DEPLOYMENT_ENVIRONMENT="development"
  export BUILDKITE_PLUGIN_GITHUB_DEPLOYMENT_GITHUB_TOKEN="randomtoken"
  export BUILDKITE_PLUGIN_GITHUB_DEPLOYMENT_REPOSITORY="mijailr/github-deployment-buildkite-plugin"
  export BUILDKITE_COMMIT="5b663073c01da5abb0417246c3dc3689e5b5c3a6"

  stub curl \
    "-X POST https://api.github.com/repos/mijailr/github-deployment-buildkite-plugin/deployments * : echo '{\"id\": \"2\"}'"
  stub buildkite-agent \
    'meta-data set "deployment-id" 2 : exit 0'

  run "$PWD/hooks/command"

  # unstub buildkite-agent

  assert_success
  assert_output --partial "Deployment 2 created successfully"
  unstub curl
  unstub buildkite-agent
}