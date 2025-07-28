# Deploy a frontend app on Google Cloud Run

### Step 01: Create the frontend app
npm create vite@latest my-web-app -- --template react
npm install
npm run build

### Step 02: Create Dockerfile
```
# Base image
# Use Nginx to serve static files
FROM nginx:alpine

# Remove default Nginx website
RUN rm -rf /usr/share/nginx/html/*

# Copy built files to Nginx web root
COPY ./my-web-app/dist /usr/share/nginx/html

# Start the app
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

### Step 03: Run Docker commands
docker build -t web-application .
docker run -it -p 9000:80 web-application



### Cloud Deployment
*Configure with gcloud sdk*
```(New-Object Net.WebClient).DownloadFile("https://dl.google.com/dl/cloudsdk/channels/rapid/GoogleCloudSDKInstaller.exe", "$env:Temp\GoogleCloudSDKInstaller.exe")

& $env:Temp\GoogleCloudSDKInstaller.exe``

docker tag web-application gcr.io/continual-math-456304-f4/web-application
docker push gcr.io/continual-math-456304-f4/web-application
    



