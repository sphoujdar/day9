#!/bin/bash -x

echo Welcome to the Employee Wage Management Program

#33% Chance that employee is absent
attendance=$((RANDOM%3))

if [ $attendance -eq 1 ]
then
	echo Employee is Present
else
	echo Employee is Absent
fi

full_day_hour=8
wage_per_hour=20

if [ $attendance -eq 1 ]
then
	((employee_wage=$full_day_hour*$wage_per_hour))
	echo Wage for $(date +'%d-%m-%y') is $employee_wage
fi

