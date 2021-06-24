#!/bin/bash
docker run -d --rm --name cudo --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro --gpus all lpap/corsika-cudo
