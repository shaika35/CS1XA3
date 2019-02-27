cd ~

file1="CS1XA3/CS1XA3/Project01/logs/todo.log"
file2="CS1XA3/CS1XA3/Project01/logs/compile_fail.log"
if [ -e "$file1" ] || [ -e "$file2" ]; then
        rm -r "$file1"
        rm -r "$file2"
fi

touch CS1XA3/CS1XA3/Project01/logs/todo.log
touch CS1X3/CS1XA3/Project01/logs/compile_fail.log

function check_errors () {
find -name "*.hs" | xargs -I {} ghc -fno-code {} &> /home/shaika35/CS1XA3/CS1XA3/Project01/logs/compile_fail.log
find -name "*.py" | xargs -I {} ghc -fno-code {} &> /home/shaika35/CS1XA3/CS1XA3/Project01/logs/compile_fail.log
}

function check_repo() {
local=$(git rev-parse master)
remote=$(git rev-parse origin/master)
if [ $local == $remote ]
then
echo "Local Repo is up to date with remote repo"
else
echo "Local Repo is not up to date with remote repo"
fi   
}

declare -a features=('check_errors' 'repo');

#Include all the features of script; print out values of the array of commands
echo "The script has the following list of features"
echo ${features[@]}
echo "enter desired function to execute:"
read command
echo "executing $command"
command=$(echo "$command"| tr "[:upper:]" "[:lower:]" 2>&1)
echo "updated and changed command is $command"
#run stated  command
for item in ${command[@]}; do
	echo "The command in array which the user input is compared to is ${item}" 
	if [ "${item}" = "${command}" ]; then
		check_${command}
		echo "match for command: found"		
	fi
done
