FROM mcr.microsoft.com/devcontainers/jekyll:2-bullseye as builder
RUN jekyll build

# TODO: Serve html