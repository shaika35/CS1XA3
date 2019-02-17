declare -a features=('check_errors');

echo "The script has the following list of features..."
echo ${features[@]}
echo "enter desired function to execute:"
read command
echo "I am executing $command"
command=$(echo "$command"| tr "[:upper:]" "[:lower:]" 2>&1)
echo "updated and changed command is $command"
for item in ${command[@]}; do
	echo "The command in array which the user input is compared to is ${item}" 
	if [ "${item}" = "${command}" ]; then
		check_${command}
		echo "match for command: found"		
	fi
done

function checkerrorS () {
find -name "*.py" | xargs -I {} ghc -fno-code {} &> error.log
}
