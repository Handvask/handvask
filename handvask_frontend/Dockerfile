FROM node:14-alpine
ENV NODE_ENV=production
ARG API_URL

WORKDIR /app

COPY ["package.json", "./"]

RUN npm install

COPY ["./src","./public",".eslintrc.json", "next.config.cjs","tsconfig.json", "./"]

ARG HTTPS_PROXY

ENV NEXT_PUBLIC_API_URL=${HTTPS_PROXY}

RUN npx next build 

EXPOSE 3000

CMD ["sh", "-c", "${NEXT_PUBLIC_API_URL}", "-bar"]

# CMD ["echo", "$NEXT_PUBLIC_API_URL", "&&", "npx", "next","start", "-H", "0.0.0.0", "-p", "3000"]
