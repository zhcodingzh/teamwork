# Stage 1: Build frontend
FROM node:24-alpine AS frontend
WORKDIR /ui
COPY ui/package.json ui/yarn.lock ./
RUN yarn install --frozen-lockfile
COPY ui/ ./
RUN yarn build

# Stage 2: Build Go binary
FROM golang:1.24-alpine AS backend
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
COPY --from=frontend /ui/build ./ui/build
RUN CGO_ENABLED=0 GOOS=linux go build -o screego .

# Stage 3: Final minimal image
FROM scratch
USER 1001
COPY --from=backend /app/screego /screego
EXPOSE 3478/tcp
EXPOSE 3478/udp
EXPOSE 5050
WORKDIR /
ENTRYPOINT ["/screego"]
CMD ["serve"]
