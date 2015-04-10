cp fig-snappy.yml fig.yml
fig stop && fig rm --force && fig ps
fig up -d && fig ps
fig logs initdb
