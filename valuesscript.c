#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Function to check if a year is a leap year
int is_leap_year(int year) {
    return (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
}

// Function to generate a random date in YYYY-MM-DD format
void generate_random_date(char *date_str, int start_year, int end_year) {
    int year, month, day;
    int days_in_month[] = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    // Seed the random number generator
    //srand(time(NULL));

    // Generate a random year within the range
    year = start_year + rand() % (end_year - start_year + 1);

    // Adjust February for leap years
    days_in_month[1] = is_leap_year(year) ? 29 : 28;

    // Generate a random month (1 to 12)
    month = 1 + rand() % 12;

    // Generate a random day (1 to days_in_month[month - 1])
    day = 1 + rand() % days_in_month[month - 1];

    // Format the date as YYYY-MM-DD
    sprintf(date_str, "%04d-%02d-%02d", year, month, day);
}

int main(){

    FILE *file = fopen("output.txt", "w");
    if (file == NULL) { // Check if the file was successfully opened
        perror("Error opening file");
        return 1; // Exit with error code
    }

    srand(time(NULL));
    
    char date[11];

//year = start_year + rand() % (end_year - start_year + 1);

    for(int i=1;i<=60000;i++){
        generate_random_date(date, 2000, 2025);
        int artist = 1 + rand() % 150;
        int venue = 1 + rand() % 100;
        int tickets = 1000 + rand() % 20000;
        int status = rand() % 2;
        if((rand() % 2)==1){
            fprintf(file, "INSERT INTO concerthistory VALUES(%d,%d,%d,%d,'%s','Completed');\n",i,artist,venue,tickets,date);
        }else{
            fprintf(file, "INSERT INTO concerthistory VALUES(%d,%d,%d,%d,'%s','Cancelled');\n",i,artist,venue,tickets,date);
        }
    }

    fclose(file);

    printf("Data successfully written to output.txt\n");

    return 0;
}

/*CREATE TABLE `concerthistory` (
  `ConId` int NOT NULL,
  `ArtistId` int DEFAULT NULL,
  `VenueId` int DEFAULT NULL,
  `NumTickets` int DEFAULT NULL,
  `ConDate` date DEFAULT NULL,
  `Status` enum('Completed','Cancelled') NOT NULL
)*/