## build docket image
docker build -t mvximvs/weatherapi .
## run image to test
docker run -p 8080:80 mvximvs/weatherapi
## push to docker hub
docker push mvximbvs/weatherapi