FROM node:18
WORKDIR /node-js
COPY . .
RUN yarn install 
EXPOSE 3000
CMD ["node", "index.js"]