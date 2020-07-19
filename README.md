# Github Deployment Buildkite Plugin

Create an report status for deployments on Github

## Example

Add the following to your `pipeline.yml`:

```yml
steps:
  - command: ls
    plugins:
      - mijailr/github-deployment#v1.0.0:
        environment: development
        repository: mijailr/deploy-app
        github_token: $GITHUB_TOKEN_SECRET
```

## Configuration

### `environment` (Required, string)

The desired environment name for the deployment.

### `environment` (Required, string)

The repository name in the form `username/repository`.

### `github_token` (Required, string)

The github personal/machine token.

## Developing

To run the tests:

```shell
docker-compose run --rm tests
```

## Contributing

1. Fork the repo
2. Make the changes
3. Run the tests
4. Commit and push your changes
5. Send a pull request