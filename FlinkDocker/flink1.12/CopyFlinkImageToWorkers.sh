#!/bin/bash
sudo docker save flink:1.12.0-scala_2.11 > flink:1.12.0-scala_2.11.tar

for i in 1 2 3 4 5 6 7 8 9
do
    echo "flink:1.12.0-scala_2.11 image is getting copied to pico2-$i ..."
    sftp pico2-$i<<EOF
    put flink\:1.12.0-scala_2.11.tar
    EOF
    echo "flink:1.12.0-scala_2.11 image is getting loaded to pico2-$i ..."
    ssh pico2-$i <<EOF
    sudo docker load -i  flink\:1.12.0-scala_2.11.tar
    if test -e flink\:1.12.0-scala_2.11.tar; then
        echo "deleting flink\:1.12.0-scala_2.11.tar ..."
        rm -rf flink\:1.12.0-scala_2.11.tar
    else
        echo "Not exist ..."
    fi
    EOF
done

rm -rf flink\:1.12.0-scala_2.11.tar
