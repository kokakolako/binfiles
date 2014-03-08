hungry_programs=(compton pulseaudio lightsOn.sh udiskie gconfd-2 unclutter)
pids=()

function detect_ip() {
    ps -e | grep "$1" | grep -ow "[0-9]*\ " | grep -ow "[0-9]*"
}

for i in ${#hungry_prograutoloadingams[@]}; do
    pids+=`detect_ip ${hungry_programs[$i]}`
done

for i in ${#pids[@]}; do
    kill ${pid[$i]}
done

