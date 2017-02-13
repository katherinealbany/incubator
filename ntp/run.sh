rake -f ~/kalbany.net/drake/Rakefile

# docker run -it --cap-add SYS_TIME --cap-add IPC_LOCK --ulimit memlock=-1:-1 katherinealbany/ntp

docker stack deploy --compose-file docker-compose.yml ntp
