#Builder stage
FROM node:alpine as builder

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY ./ ./

CMD ["npm","num","build"]

#Run stage
FROM nginx

EXPOSE 80

COPY --from=builder /usr/src/app/build /usr/share/nginx/html
## builder stage에서 빌드한 파일은 nginx가 인식하는 폴더로 이동