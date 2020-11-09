#!/bin/bash -x

echo Welcome to the Employee Wage Management Program

#Function to get work hours

get_work_hours () {

type_of_employee=$1

if [ $type_of_employee -eq 0 ]
then
	#Part time employee may work from 4 to 7 hours
        ((part_time_hour=$((RANDOM%4))+4))
	todays_hours=$part_time_hour
else
	#Full time employee may work from 6 to 9 hours
	((full_time_hour=$((RANDOM%4))+6))
	todays_hours=$full_time_hour
fi

return $todays_hours

}



#Employee Related Config
wage_per_hour=20
#25% Chance that employee is part time
((employee_type=RANDOM%4))
days_attended=0
total_hours=0
declare -A wages_log

#Calculate Days attended and hours worked
for working_day in {1..21}
do

	#Calculate wage for a maximum of 20 days or 100 hours
        if [ $days_attended -eq 21 -o $total_hours -ge 100 ]
        then
                ((monthly_wage=$total_hours*$wage_per_hour))
                echo Employee Attended $days_attended Days and worked $total_hours hours in them
                echo Make monthly payment of $monthly_wage
                echo Employee has reached limit of working this month
		wages_log[Total_Wage]=$monthly_wage
                break;
        elif [ $working_day -eq 21 ]
        then
                echo Employee Attended $days_attended Days and worked $total_hours hours in them
                echo That is below minimum work threshhold for payment so cannot make payment right now
        fi



	#33% Chance that employee is absent
	((attendance=RANDOM%3))
	if [ $attendance -ne 0 -a $working_day -le 20 ]
	then
		((days_attended+=1))
		echo Employee was present on Day $working_day
	elif [ $working_day -eq 21 ]
	then
		continue
	else
		echo Employee was absent on Day $working_day
		continue
	fi


	if [ $employee_type -eq 0 ]
	then
		get_work_hours $employee_type
		hours_today=$?
		((total_hours+=$hours_today))
		echo Part time hours on Day $working_day : $hours_today
	else
		get_work_hours $employee_type
		hours_today=$?
		((total_hours+=$hours_today))
                echo Full time hours on Day $working_day : $hours_today
	fi
	((daily_wage=$todays_hours*$wage_per_hour))
	echo Wage for Day $working_day is Rs. $daily_wage

	if [ $working_day -lt 21 ]
	then
		day_string=$(date -d +"${working_day} days" +'%d-%m-%y-%A')
		key=${working_day}_${day_string}
		wages_log[Day_$key]=$daily_wage
	fi
done


for log_key in ${!wages_log[@]}
do
	echo Log Key : $log_key --- Wage ${wages_log[$log_key]}
done
