//primer C++

//take a time in hrs:min am/pm and convert it to 24-hrs time format.

#include<iostream>
using namespace std;

int conversion(int hrs, int min, char meridiam, int hrs2)
{

    if(meridiam == 'pm' || meridiam == 'p.m.')
    hrs2 = hrs + 12;
    return hrs2;

}


void display(int hrs, int min, char meridiam)
{
    cout<<hrs<<":"<<min<<" "<<meridiam<<"\n";
}

void display(int hrs2, int min)
{
    cout<<hrs2<<":"<<min<<"\n";
}



int main()
{
    int  hrs, min, hrs2;
    char meridiam;

    cout<<"Enter the hours: ";
    cin>>hrs;
    cout<<"\nEnter the minutes: ";
    cin>>min;
    cout<<"\nIs this am or pm? ";
    cin>>meridiam;

    conversion(hrs, min, meridiam, hrs2);

    cout<<"\n\nThe time in 12-hrs format is: ";
    display(hrs, min, meridiam);
    cout<<"\nThe time in 24-hrs format is: ";
    display(hrs2, min);

    return 0;
}