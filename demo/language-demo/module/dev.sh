
touch hello.she
touch try.she
she hello.she -o hello.scm &
she try.she -o try.scm &

read

pkill -f "she hello"
pkill -f "she try"

csi -s try.scm