#!/bin/bash
echo "The script PID is $$"
sleep 30 &
childPID=$!
echo "Child PID is $childPID"
echo "Child process with PID $childPID is now in the OS waiting queue."
echo "The child process is waiting for a software interrupt from the user."
echo "Enter the SIGINT interrupt to have the child process execute on the CPU."
read input
if [[ "$input" == "SIGINT" ]]; then
  kill -SIGINT $child_pid
fi
wait $child_pid
echo "Enter SIGQUIT interrupt."
kill -STOP $childPID
trap 'echo "\nSIGQUIT signal received!"' SIGQUIT
echo "Completed executing."
echo "Terminated all processes."
exit 0