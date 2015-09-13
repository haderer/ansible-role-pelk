#!/bin/bash

SESSION=Docker Logs

tmux kill-session -t $SESSION
tmux source-file tmux.conf

tmux new-session -d -s $SESSION


#tmux select-pane -t 0 
tmux send-keys "docker logs -f pelk-logstash" C-m
tmux split-window -v 'docker logs -f pelk-elasticsearch'
tmux split-window -h 'docker logs -f pelk-kibana'
tmux split-window -h -t 0 'docker logs -f pelk-packetbeat'

#tmux select-pane -t 1 
#tmux split-window -v

#tmux select-pane -t 1
#tmux send-keys "docker logs -f pelk-kibana" C-m

#tmux select-pane -t 2
#tmux send-keys "docker logs -f pelk-elasticsearch" C-m

#tmux select-pane -t 3
#tmux send-keys "docker logs -f pelk-logstash" C-m

#tmux select-pane -t 4
#tmux send-keys "docker logs -f pelk-packetbeat" C-m

tmux -2 attach-session -t $SESSION