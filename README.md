<p align="center">
  <img src="docs/res/github-graph.png">
</p>

# GitHub Actions Runner

[![Actions Status](https://github.com/actions/runner/workflows/Runner%20CI/badge.svg)](https://github.com/actions/runner/actions)

The runner is the application that runs a job from a GitHub Actions workflow. It is used by GitHub Actions in the [hosted virtual environments](https://github.com/actions/virtual-environments), or you can [self-host the runner](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/about-self-hosted-runners) in your own environment.

## Get Started

For more information about installing and using self-hosted runners, see [Adding self-hosted runners](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/adding-self-hosted-runners) and [Using self-hosted runners in a workflow](https://help.github.com/en/actions/automating-your-workflow-with-github-actions/using-self-hosted-runners-in-a-workflow)

Runner releases:

![win](docs/res/win_sm.png) [Pre-reqs](docs/start/envwin.md) | [Download](https://github.com/actions/runner/releases)  

![macOS](docs/res/apple_sm.png)  [Pre-reqs](docs/start/envosx.md) | [Download](https://github.com/actions/runner/releases)  

![linux](docs/res/linux_sm.png)  [Pre-reqs](docs/start/envlinux.md) | [Download](https://github.com/actions/runner/releases)

### Using Makefile
Create a .env file based on the example provided and provide a PAT with repo admin permissions. If you're creating runners across the org then the PAT needs org admin permissions.

 <sub>> :warning: It is important that you do not delete the `runners` directory created as it will be required to remove the runners from your system background process.</sub>

#### Commands:
1. `make runners group=<group-here>` - spawn 5 new GitHub self-hosted runners, assign runner to optional group
2. `make create name=<name-here>` - spawn an individual runner with specified name
2. `make create-org name=<name-here>` - spawn an individual runner with specified name in the defined group
3. `make remove` - removes all runners running as a service
4. `make delete` - force deletes a runner from the service
5. `make clean` - removes `runners` directory

## Contribute

We accept contributions in the form of issues and pull requests. The runner typically requires changes across the entire system and we aim for issues in the runner to be entirely self contained and fixable here. Therefore, we will primarily handle bug issues opened in this repo and we kindly request you to create all feature and enhancement requests on the [GitHub Feedback](https://github.com/community/community/discussions/categories/actions-and-packages) page. [Read more about our guidelines here](docs/contribute.md) before contributing.
