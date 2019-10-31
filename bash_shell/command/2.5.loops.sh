for (( i=0; i < 20; i++ ))
do
    echo $i
    echo $i > file${i}.txt
done

ls

for f in $(ls *txt)
do
    echo "File $f containsL $(cat $f)"
done

for f in file1.txt file2.txt file3.txt
do
    echo "File $f contains: $(cat $f)"
done

n = 0
while [[ ! -a newfile ]]
do
    ((n++))
    echo "In iteration $n"
    if [[ $(cat file${n}.txt == "15" ]]
    then
            touch newfile
    fi
done

