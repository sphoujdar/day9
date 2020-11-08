#!/bin/bash -x

echo Welcome to the Employee Wage Management Program

attendance=$((RANDOM%2))

if [ $attendance -eq 1]
	echo Employee is Present
else
	echo Employee is absent
fi
