#!/bin/bash -x

echo Welcome to the Employee Wage Management Program


#Employee Related Config
part_time_hour=6
full_time_hour=8
wage_per_hour=20
working_days_per_month=20
#33% Chance that employee is absent
((attendance=RANDOM%3))
#25% Chance that employee is part time
((employee_type=RANDOM%4))


#Creating a concatenated string to store individual employee related config
individual_employee_config=$attendance$employee_type


case $individual_employee_config in
	#if attendance is 0 , employee is absent
	00|01|02|03)
	echo Employee is Absent;;

	#if employee_type is 0 , employee is part time
	10)
	echo Employee is Present
	echo Employee is works Part Time
	((employee_wage=$part_time_hour*$wage_per_hour))
	echo Wage for $(date +'%d-%m-%y') is $employee_wage
	echo Monthly wage is $(($employee_wage*$working_days_per_month))
	;;

	#all other cases employee is Present and working full time
	*)
	echo Employee is Present
        echo Employee works Full Time
        ((employee_wage=$full_time_hour*$wage_per_hour))
        echo Wage for $(date +'%d-%m-%y') is Rs.$employee_wage
	echo Monthly wage is $(($employee_wage*$working_days_per_month))
	;;
esac

