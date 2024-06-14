FROM node:20

# Set the working directory
WORKDIR /app

COPY package*.json ./

RUN npm install
# Copy the project files to the container
COPY . .

# Install project dependencies
RUN npm run build

FROM nginx:alpine

COPY --from=0 /app/dist /usr/share/nginx/html

EXPOSE 80
# Set the command to run the Astro project
CMD ["nginx", "-g", "daemon off;"]
