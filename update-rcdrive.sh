#!/bin/bash

echo What is the source directory? 
read sourceloc
#echo "In directory $sourceloc"
cd "$sourceloc"
echo What is the destination directory in the rc-drive
read destloc
#echo "Destination directory $destloc"
while [ ! -d $sourceloc ] 
do
	echo try again
        read sourceloc	
done

while [ ! -d $destloc ] 
do 
	echo try again 
	read destloc
done

echo 'Would you like to sync by size only?[y/n]' 
read sizeyn
#echo 'Would you like to md5sum after transfer is complete? Note this may take some time [y/n]'
#read md5 


if [ $sizeyn == y ] ; then
	
        rsync -r -u --size-only --progress $sourceloc $destloc
elif [ $sizeyn == n ] ; then
	
	rsync -r -u --progress $sourceloc $destloc
fi
#if [ $md5 == Y ]; then
#       cd ~/Desktop
#	find -type f -exec md5sum {} + | sort > ~/Desktop/a.MD5SUMS
#	find -type f -exec md5sum {} + | sort > ~/Desktop/b.MD5SUMS
#	diff -u ~/Desktop/a.MD5SUMS
#	diff -u ~/Desktop/b.MD5SUMS
#else 
#	echo complete! 
#fi




