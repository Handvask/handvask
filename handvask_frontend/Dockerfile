FROM node:14-alpine
ENV NODE_ENV=production

WORKDIR /app

COPY ["./src","./public",".eslintrc.json", "next.config.cjs","package.json","tsconfig.json", ".env", "./"]

RUN npm install --loglevel verbose

RUN npx next build 

EXPOSE 3000

CMD ["npx", "next","start"]