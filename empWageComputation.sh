#!/bin/bash -x

echo Welcome to the Employee Wage Management Program


#Employee Related Config
wage_per_hour=20
#25% Chance that employee is part time
((employee_type=RANDOM%4))
days_attended=0
total_hours=0

#Calculate Days attended and hours worked
for working_day in {1..20}
do
	#33% Chance that employee is absent
	((attendance=RANDOM%3))
	if [ $attendance -ne 0 ]
	then
		((days_attended+=1))
		echo Employee was present on Day $working_day
	else
		echo Employee was absent on Day $working_day
		continue
	fi


	if [ $employee_type -eq 0 ]
	then
		#Part time employee may work from 4 to 7 hours
		((part_time_hour=$((RANDOM%4))+4))
		todays_hours=$part_time_hour
		((total_hours+=$part_time_hour))
		echo Part time hours on Day $working_day : $part_time_hour
	else
		#Full time employee may work from 6 to 9 hours
		((full_time_hour=$((RANDOM%4))+6))
		todays_hours=$full_time_hour
		((total_hours+=$full_time_hour))
                echo Full time hours on Day $working_day : $full_time_hour
	fi
	((daily_wage=$todays_hours*$wage_per_hour))
	echo Wage for Day $working_day is Rs. $daily_wage

	 #Calculate wage for a maximum of 20 days or 100 hours
        if [ $days_attended -eq 20 -o $total_hours -ge 100 ]
        then
                ((monthly_wage=$total_hours*$wage_per_hour))
                echo Employee Attended $days_attended Days and worked $total_hours hours in them
                echo Make monthly payment of $monthly_wage
                echo Employee has reached limit of working this month
                break;
        elif [ $working_day -eq 20 ]
        then
                echo Employee Attended $days_attended Days and worked $total_hours hours in them
                echo That is below minimum work threshhold for payment so cannot make payment right now
        fi



done
