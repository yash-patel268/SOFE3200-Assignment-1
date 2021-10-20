#!//usr/bin/perl

#Initialize the variables that will be used throughout the code
$checker=0, $name, $firstName, $lastName;


print "Please enter a name either first, last, or any portion of the a person's name.\n";

#take input of user for the name they are looking for
$name = <>;
#removed last character to make sure just the name without a space is inputted
chop($name);
print "the name you have entered is " ,$name;
print "\n";  

#Open phones directory file which includes all the recorded names with numbers, however, if the file cant open we send a message
open(DATA, '<', 'phones') or die "Couldn't open file\n";

#cycle through the files information
while(<DATA>){
	#make array to store the information
	@phones = split(' ', $_);
	
	#remove spaces
	chop(@phones[0]);
	
	#assifn the first name and last name to a variable
	$firstName = @phones[0];
	$lastName = @phones[1];
	
	#compare the variables without be case sensitive, also portions the name is allowed 
	if((uc $firstName) =~ (uc $name) or (uc $lastName) =~ (uc $name)){
		#print the line where the information sits
		print($_);
		#checker variable is changed and will not do anything
		$checker=1;
		#break from while
		last;
	}
}

#if name is not found return name with a print saying not found
if($checker eq 0){
	print($name, " NOT FOUND in the phone directory file!\n");
}


close(DATA);
