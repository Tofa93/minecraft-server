---
toc_max_heading_level: 4
sidebar_position: 2
tags:
  - project
  - checklist
sidebar_label: Checklist
description: An editable, copyable checklist with all tasks for the Minecraft Server project.
---

# Minecraft Server - Checklist

Please work through every item before you submit this project.
If you added anything beyond these requirements, mention it briefly so your mentor can review it when needed.

## 1. Repository

### Existing files

- [x] A `.gitignore` file exists and excludes all irrelevant content from the Git repository.
- [x] A `docker-compose.yaml` exists and meets the requirements below.
- [x] A `README.md` file exists and is written according to the criteria below.
- [x] The repository contains no further files unless they are explicitly named and described in the `README.md`.

### Dockerfile

- [x] A `Dockerfile` builds a suitable image to start a Minecraft server.
  - [ ] See **3. Hints** for the download link to the server application.
- [x] The `Dockerfile` installs and, if needed, configures all required packages in the base image.
- [x] Your server can always start. Use default values for environment variables where needed.
- [x] You do not use a prebuilt Minecraft image.

### docker-compose.yaml

- [x] One service is defined and configured: `mc-server`.
- [x] An env configuration for the Minecraft server service configures all non-critical variables (no auth!).
- [x] The required ports are published so that the container is reachable from the internet.
- [x] Volumes are configured for the container data, so that the content is persisted on a file system and the game state is not lost.

### README.md

- [x] The README contains a table of contents (ToC).
- [x] A section with a description of the repository exists. It names the main contents and the purpose of the repository.
- [x] A "Quickstart" section is part of the README. It briefly lists the prerequisites and describes how to get started quickly.
- [x] A detailed version of the quickstart exists as a "Usage" section. It explains the configuration in more detail, including how to modify relevant parts to get different results.

## 2. Documentation

Document your code and your project in the repository in the form of a README file.
The documentation language for all projects (and related materials) is English.

## 3. Hints

You can download a Minecraft server binary directly from the Minecraft website (use the Java version):

- [https://www.minecraft.net/de-de/download](https://www.minecraft.net/de-de/download)

### General hints

- [x] In addition to your GitHub repository, record and share a short Loom video (max. 5 minutes) in which you show your submission and present what you did. You do not have to mention every detail, but briefly explain and show all relevant steps.

### Security hints

- [x] Do not store SSH keys in the workspace of your Git repository.
- [x] Do not store passwords, tokens, or user names in your code. Use environment variables instead.
- [x] Do not store IP addresses or other sensitive information in a Git repository.

### Code conventions

- [x] Build args, environment variables, and shell variables follow the naming convention `UPPER_CASE_WITH_UNDERSCORE`.
- [x] Always use the `{}` notation when you reference a variable to avoid interpretation errors: `${SOME_VAR_VALUE}` instead of `$SOME_VAR_VALUE`.
- [x] Configure default values for build args or environment variables, but only where it makes sense.
- [x] Critical configuration such as tokens or passwords is not stored in the code repository. Pass it into a container instead, for example via an `.env` file.

## 4. Testing

Before you submit the project, make sure that you have tested the following:

- [x] The Minecraft server is reachable at the IP address of your cloud VM on port `8888`.
- [x] You have two ways to test the server: start the game and connect to your server (see the next item), or connect to the Minecraft server with a script. For the script, you can use the Python module [mcstatus](https://github.com/py-mine/mcstatus).
- [x] (optional) You can connect your Java Minecraft client on your computer to the server on your cloud VM and play Minecraft.
- [x] After a restart of the server, the configured data is still available and is not deleted or overwritten. This includes the game state and the configuration of the game server.
- [x] The service containers restart as soon as an error terminates the container.