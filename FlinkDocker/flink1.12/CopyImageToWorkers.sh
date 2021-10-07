 #!/bin/bash

for i in {1..9}
 do
    #echo -e "Removing current docker image in pico1-$i..."
    #ssh pico1-$i docker rmi $(docker images 'flink')
    echo -e "Copying docker image to pico1-$i..."
    docker save flink:1.12.0-scala_2.11 | gzip | DOCKER_HOST=ssh://guru@pico1-$i docker load
 done