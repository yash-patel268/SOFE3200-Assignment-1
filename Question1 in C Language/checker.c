#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <string.h>

//custom function with parameters of 2 files to check how similar to files are
int compareFiles(FILE *fpt, FILE *fpt2);

int main(int argc, char *argv[]) {
	//Hard coding the files in
	FILE *fpt = fopen("text.txt", "r");
	FILE *fpt2 = fopen("text2.txt", "r");
	
	//variable to store the percentage difference of the 2 files
	int diff;
	
	//Check if the files exist or if the assignment failed resulting in the application quiting
	if (fpt == NULL|| fpt2==NULL) {
		printf("Unable to open one or more files for reading\n");
		exit(0);
	}
	
	//use the custom functiona and assign the return to diff
	diff=compareFiles(fpt, fpt2);
	
	//print the diff 
	printf("the similarities in the documents in a percent is: ");
	printf("%d", diff);
	printf("\n");
	
	//close the files
	fclose(fpt);
	fclose(fpt2);

}

//custom function is updated
int compareFiles(FILE *fpt, FILE *fpt2){
	//variable to hold the files characters
	char ch1, ch2;
	//varaibles to hold line number and column in order to cycle through the file
	int line=1;
	int col=0;
	//variable to hold number of similar variables
	int percentage=0;
	//variable to hold total characters checked
	int total=0;
	//variable to hold the value to be returned
	double final=0;
	
	
	//while the first and second file still have character we continue
	while(ch1!=EOF && ch2!=EOF){
		//increment total character every iteration
		total++;
		//hold characters for that iteration
		ch1=fgetc(fpt);
		ch2=fgetc(fpt2);
		
		//if one of the files reach the end of that line
		if(ch1=='\n'&& ch2=='\n'){
			line+=1;
			col=0;
		}
		
		//If the characters at the specifc location are the same we increment percent and print the location
		if(ch1==ch2){
			percentage+=1;
			printf("At line: ");
			printf("%d", line);
			printf(" and column: ");
			printf("%d", col);
			printf(" they are matching");
			printf("\n");
			
		}
		
		col++;
	}
	//since the program will do an extra 2 iteration to check, it must be corrected so the stats are unaffected
	percentage-=2;
	total-=2;
	
	//final has the calculation
	final = ((double)percentage/(double)total)*100;
	
	printf("The last 2 lines with columns were check to see if the file ended and will not be added to the stats.");
	printf("\n");
	
	printf("%d", percentage);
	printf("\n");
	
	printf("%d", total);
	printf("\n");
	
	printf("%f", final);
	printf("\n");
	return final;
}
