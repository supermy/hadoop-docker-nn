docker build -t nn_base nn/
docker build -t dn_base dn/
docker build -t yarn_base yarn/
fig stop && fig rm --force
fig up -d && fig ps  && fig logs