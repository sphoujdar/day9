#!/bin/bash -x

echo Welcome to the Employee Wage Management Program

#33% Chance that employee is absent
attendance=$((RANDOM%3))
#25% Chance that employee is part time
((employee_type=RANDOM%4))

if [ $attendance -eq 1 ]
then
	echo Employee is Present
	if [ $employee_type -eq 1 ]
	then
		echo Employee works Part Time
	else
		echo Employee works Full Time
	fi
else
	echo Employee is Absent
fi

part_time_hour=6
full_time_hour=8
wage_per_hour=20

if [ $attendance -eq 1 ]
then
	if [ $employee_type -ne 1 ]
	then
		((employee_wage=$full_time_hour*$wage_per_hour))
	else
		((employee_wage=$part_time_hour*$wage_per_hour))
	fi
	echo Wage for $(date +'%d-%m-%y') is $employee_wage
fi

