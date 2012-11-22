

touch hello2.scm.she
touch hello2.setup.she
touch hello2.meta.she

she hello2.scm.she -o hello2.scm &
she hello2.setup.she -o hello2.setup &
she hello2.meta.she -o hello2.meta &

read

pkill -f "she hello2"
