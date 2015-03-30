# build all docker images except jamesmo/cdh5:latest
#sudo docker build -t jamesmo/nn:cdh5 nn/
#sudo docker build -t jamesmo/dn:cdh5 dn/
#sudo docker build -t jamesmo/zk:cdh5 zk/
#sudo docker build -t jamesmo/hb:cdh5 hmaster/
#sudo docker build -t jamesmo/rs:cdh5 hregionserver/
cd nn
fig build
cd  ../dn/
fig build
cd  ../hmaster/
fig build
cd  ../hregionserver/
fig build
docker images|grep base
