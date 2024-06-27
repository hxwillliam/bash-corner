#!/bin/bash

showuptime(){
  up=$(uptime -p)
  since=$(uptime -s)
  cat <<EOF
---------
This pc has been up for ${up}
and has been running since ${since}
---------
EOF
}
showuptime
