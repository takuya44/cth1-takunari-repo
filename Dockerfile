# Stage 1: Build stage
#FROM alpine:latest AS builder
FROM public.ecr.aws/docker/library/alpine

# 必要なツールをインストールする模擬構成
RUN apk --no-cache add curl

# Stage 2: Final stage
#FROM nginx:alpine
FROM public.ecr.aws/docker/library/nginx

# index.htmlをローカルディレクトリからNginxのHTMLフォルダにコピーする。
COPY ./index.html /usr/share/nginx/html/index.html

# Nginxサーバーのアクセスポート80を公開する。
EXPOSE 80

# Nginx serverを起動する
CMD ["nginx", "-g", "daemon off;"]