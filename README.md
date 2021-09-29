# Triton Webinar

Build the container using Docker file
```
docker build -t triton_webinar2021:latest .
```

Run the container 
```
docker run -it --gpus=1 --rm -p31000:31000 triton_webinar2021:latest
```