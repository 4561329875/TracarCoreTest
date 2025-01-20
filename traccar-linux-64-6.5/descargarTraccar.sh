#!/bin/bash
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker


sudo docker pull postgres
sudo docker run --name postgres-container -e POSTGRES_USER=user -e POSTGRES_PASSWORD=1234 -e POSTGRES_DB=db -p 5432:5432 -d postgres


sudo docker restart postgres-container
sudo ./traccar.run

sudo cp -f ./traccar.xml /opt/traccar/conf/


sudo systemctl start traccar
sleep 1s
sudo docker restart postgres-container
sleep 10s
echo listo
