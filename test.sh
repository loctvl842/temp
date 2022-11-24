declare a arr=("nm-applet" "blueman-applet" "pa-applet" "mictray")

for (( i = 0; i < ${#arr[@]} ; i++ )); do
  eval "killall ${arr[$i]}"
done

sleep 0.5
for (( i = 0; i < ${#arr[@]} ; i++ )); do
    # Run each command in array 
    preProcess=$(pgrep -x ${arr[$i - 1]} > /dev/null && echo "Process found" || echo "Process not found")
    echo $process
    sleep 0.5
    if [ $i == 0 ] || [[ $preProcess == "Process found" ]]; then
      eval "${arr[$i]} &"
      echo "Executed ${arr[$i]}"
    fi
done
