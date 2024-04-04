FROM docker.io/denoland/deno:1.29.4

WORKDIR /app

COPY deps.ts main.ts handler.ts /app/
RUN deno cache deps.ts
RUN deno cache main.ts
RUN deno cache handler.ts

EXPOSE 8080

CMD ["run", "--allow-net", "--allow-env", "main.ts"]
