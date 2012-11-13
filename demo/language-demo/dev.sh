
cd `dirname $0`
echo '-- start watching'

# guil demo.guil &
# csi -s demo.scm &

guil ruby-demo.guil &
touch ruby-demo.scm
reload csi -s ruby-demo.scm &

read

pkill -f guil
pkill -f 'csi '

echo '-- stop watching'