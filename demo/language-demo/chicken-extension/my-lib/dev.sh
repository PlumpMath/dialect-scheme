

touch my-lib.scm.she
touch my-lib.setup.she
touch my-lib.meta.she

she my-lib.scm.she -o my-lib.scm &
she my-lib.setup.she -o my-lib.setup &
she my-lib.meta.she -o my-lib.meta &

read

pkill -f "she my-lib"