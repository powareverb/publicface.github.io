FROM mcr.microsoft.com/devcontainers/jekyll:2-bullseye as jekyll
WORKDIR /home/vscode/site/
USER    vscode
COPY    . /home/vscode/site/
RUN     sudo chown -R vscode:vscode .
RUN     sudo gem update --system 3.6.2
RUN     bundle install &&\
    jekyll build

# TODO: Serve html
FROM nginx
COPY  --from=jekyll /home/vscode/site/_site /usr/share/nginx/html
