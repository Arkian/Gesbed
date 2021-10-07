 #!/bin/bash

for i in {1..9}
 do
    echo -e "Copying docker image to pico1-$i..."
    docker save minio/minio:RELEASE.2020-12-03T05-49-24Z | gzip | DOCKER_HOST=ssh://guru@pico1-$i docker load
 done