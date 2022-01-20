# 16 is there to avoid Node bugs

# This is build phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# This is run phase
FROM nginx
# Copy things from builder phase so from /app/build folder
# We need the bare minimum from nginx
COPY --from=builder /app/build /usr/share/nginx/html

