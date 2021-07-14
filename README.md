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
docker run --gpus all -d --rm -h <LABEL> --name cudo cudominer
```

Set `<LABEL>` to distinguish your workers from one another.

2. Set organization

```bash
docker exec -it cudo cudominercli login <ORGANIZATION_NAME>
```
