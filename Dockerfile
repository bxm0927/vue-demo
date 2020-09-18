# 使用 Docker 多阶段构建，在 Nginx 上部署 vue-cli 项目

# alpine 版本更加轻量，生成的镜像文件更小
FROM node:12.18-alpine AS builder
WORKDIR /app
# 先安装依赖，可以利用镜像层缓存机制 (Layer Caching)，获得更快的构建速度
COPY package*.json ./
RUN npm install --registry=https://registry.npm.taobao.org
COPY . .
RUN npm run build

FROM nginx:alpine
WORKDIR /app
# 将前一阶段构建的产物拷贝到当前的镜像中
COPY --from=builder /app/dist .
COPY nginx.conf /etc/nginx/nginx.conf
