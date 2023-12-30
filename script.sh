# https://github.com/hugomd/parrot.live/blob/master/frames/0.txt
#Curl that but for 0 to 10 .txt

BASEDIR="https://raw.githubusercontent.com/hugomd/parrot.live/master/frames/"
TMP_DIR="/tmp/parrot_frames"

# Create the temporary directory if it doesn't exist
mkdir -p "$TMP_DIR"

while true; do
    for i in {0..9}; do
        FRAME_FILE="$TMP_DIR/frame_$i.txt"

        if [ ! -f "$FRAME_FILE" ]; then
            curl -o "$FRAME_FILE" "$BASEDIR$i.txt" -s -N
        fi

        cat "$FRAME_FILE"
        sleep 0.1
    done
done