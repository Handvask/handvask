FROM node:14-alpine
ENV NODE_ENV=production

WORKDIR /app

COPY ["package.json", "./"]

RUN npm install

COPY ["./src","./public",".eslintrc.json", "next.config.cjs","tsconfig.json", "prepare.sh", "./"]

ARG API_URL

ENV API_URL ${API_URL}

RUN sh ./prepare.sh

RUN npx next build

EXPOSE 3000
# 
# CMD ["sh", "-c",  "${NEXT_PUBLIC_API_URL}"]

CMD ["npx", "next","start", "-H", "0.0.0.0", "-p", "3000"]

COPY test .

RUN npm install cypress 