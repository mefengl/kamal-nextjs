# Use the official Node.js base image
FROM node:18-alpine

# Install curl
RUN apk add --no-cache curl

# Set working directory
WORKDIR /app

# Copy dependency definitions to the container
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy project source code to the container
COPY . .

# Build project
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Start the Next.js application
CMD ["npm", "start"]
