#!/bin/bash

larger_size=0
inbox_small_range=0
inbox_medium_range=0
inbox_large_range=0

while IFS=' ' read -r user inbox_name inbox_range size_name size
do
	#Guarda no array os usuários
	users[i]="$user"
	((i+=1))
		
	#Verifica o range da inbox
	if [ $inbox_range -ge 25000 -a $inbox_range -le 48999 ]
	then
		((inbox_small_range+=1))
	elif [ $inbox_range -ge 49000 -a $inbox_range -le 50000 ]
	then
		((inbox_medium_range+=1))
	elif [ $inbox_range -ge 50001 ]
	then
		((inbox_large_range+=1))
	fi

	#Verifica qual tem o maior "size"
	if [ $size -gt $larger_size ];
	then
		larger_size=$size
		user_inbox="$user"
	fi
done <input

echo "Usuário com maior size $user_inbox"

echo "Todos usuários:"
for item in "${users[@]}"
do
	echo "$item"
done | sort

echo "Entre 25000 e 48999 msgs: $inbox_small_range"
echo "Entre 49000 e 50000 msgs: $inbox_medium_range"
echo "Acima de 50001 msgs: $inbox_large_range"
