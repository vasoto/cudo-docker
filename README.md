# cudo-docker
Docker container for [cudominer](https://cudominer.com). 
This image supports Nvidia devices.

## Build

```bash
docker build -t cudominer .
```

## Run

1. Run the container

```
docker --gpus all -d --rm --name cudo cudominer
```

2. Set organization

```bash
docker exec -it cudo cudominercli login <ORG_NAME>
```
