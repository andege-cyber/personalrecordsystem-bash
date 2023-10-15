#!bin/bash
declare -a records
add_record() {
    read -p "Enter your name: " name
   read -p "Enter your age: " age
    read -p "What is your favorite color: " color
    records+=("$name, $age, $color")
    echo "Record added successfully"
}
edit_record() {
    read -p "Enter the name of the person to edit: " search_record
    for i in "{!records[@]}"; do
        record="${records[@]}"
        name="${record%%,*}"
        if [ "$name" = "$search_record" ]; then
            read -p "Enter the new age for $name: " new_age
           {!records[@]}="$name, $new_age"
            echo "Record updated sucefuly."
            return
    fi
  done
  echo "record not found"
}
search_record() {
    read -p "Enter the name to search for: " search_record
    for record in "${records[@]}"; do
        name="${record%%,*}"
        age="${record##*, }"
        if [ "$name" = "$search_record" ]; then
            echo "Name: $name, Age: $age"
            return
        fi
   done
   echo "Record not found"
}
generate_report() {
    echo "People records: "
    for record in "${records[@]}"; do
        echo "$record"
    done
}
 while true; do
    echo "1. add a new record"
    echo "2. edit an existing record"
    echo "3. search for a record"
    echo "4. generate a report"
    echo "5. exit"
    read -p "enter your choice: " choice

    case $choice in
          1)
             add_record
             ;;
          2)
             edit_record
             ;;
          3)
             search_record
             ;;
          4)
             generate_report
             ;;
          5)
            echo "Bye!!"
            exit 0
            ;;
          *)
            echo "Invalid choice"
            ;;
     esac
done
