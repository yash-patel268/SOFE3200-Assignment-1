#!//usr/bin/perl

#where the text file locations are set
$textFile1 = "text.txt";
$textFile2 = "text2.txt";

#open the text files for use, however, if cant be open then send a message
open FILE1, "$textFile1" or die "Could not open $textFile1 \n";
open FILE2, "$textFile2" or die "Could not open $textFile2 \n";

#Assign the files to arrays and the close the files for optimization
@txt1 = (<FILE1>);
close FILE1;
@txt2 = (<FILE2>);
close FILE2;

#Assin variables to hold the total lines and well as matched lines to determine stats later
$lineMatch=0;
$line=0;

#Cycle through the first file which will also cycle throught the second file
#Since the files are now arrays the array indexes hold each line of the file.
#convert to scalar so its allowed to be compared to variable x
for($x=0; $x < scalar(@txt1); $x++){
	#increment line var every iteration
	$line++;
	#if line is the same in both files
	if(@txt1[$x] eq @txt2[$x]){
		#increment lineMatch since it found match
		$lineMatch++;
		print "Line number ". $line ." is a match.\n";
	}
}

print "this is line match ". ($lineMatch)."\n";
print "this is line ". ($line)."\n";

#result is variable that hold the calculation to find the simularity percentage.
$result=($lineMatch/$line)*100;
print "the matched line pertcentage is ". $result ."%.\n";
