
var1=$(zenity --forms --title="Create user" --text="Add new user" --separator "-"\
--add-entry="First Name" \
--add-entry="Last Name" \
--add-entry="Username" \
--add-password="Password" \
--add-password="Confirm Password" \
--add-calendar="Birthdate")
IFS=- read fname lname uname pass cpass bdate <<< $var1
echo $fname
echo $lname
echo $uname
echo $pass
echo $cpass
echo $bdate
