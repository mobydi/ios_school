//
//  main.c
//  cal variation command
//
//  Created by Ilya Balashov on 7/6/12.
//
// Excluded support for Right-To-Left Languages (Hebrew, Arabic and etc). I can implement it, if need be.

#define UNICODE
#define _UNICODE

#include <stdio.h>
#include <wchar.h>
#include <time.h>
#include <locale.h>
#include <langinfo.h>


int getfirstdayofweek(void);
void help(void);


#ifdef __APPLE__
#include "TargetConditionals.h"
#ifdef TARGET_OS_MAC

#include <CoreFoundation/CFCalendar.h>
int getfirstdayofweek(void)
{
    CFCalendarRef calendar = CFCalendarCopyCurrent();
    CFIndex index = CFCalendarGetFirstWeekday(calendar);
    CFRelease(calendar);
    return index - 1;
}
#endif
#else 
int getfirstdayofweek(void)
{
    //glibc >= 2.2
#ifdef _NL_TIME_FIRST_WEEKDAY
    return *nl_langinfo (_NL_TIME_FIRST_WEEKDAY) - 1;
#else
    return 0;   
#endif
}
#endif 

int isutf8str(const char* p)
{
    for(; *p != 0; ++p)
    {
        if( (*p & 0xC0) == 0x80 )
            return 2;
    }
    return 1;
}

int main(int argc, const char * argv[])
{
    //setlocale(LC_ALL, "ru_RU"); //set user locale
    //setlocale(LC_ALL, "en_GB");
    //setlocale(LC_ALL, "ja_JP");
    setlocale(LC_ALL, "zh_CN");
    
    if(argc != 2)
    {
        help();
        return -1;
    }
    
    time_t t = time(NULL);                     //local time
    //should not free localtime result, due to it statically allocated (not thread safe func)
    struct tm tm = *localtime(&t);             //local calendar time
    struct tm tm_now = tm;                     //time now
    int first_weekday = getfirstdayofweek();   //first weekday   
    
    if (strptime(argv[1], "%m.%Y", &tm) == NULL)
    {
        help();
        return -1;
    }
    
    //formatting consts
    const int wdayslen = 2; //max len of weekday name (ABDAY_1 define 2 or 3 letters abr names, for some locale, we cut it)     
    const int dayspacelen = 2;  //space between days
    
    //reset the first day
    tm.tm_mday = 1;
    time_t tmp = mktime(&tm);
    localtime(&tmp);
    
    //wdays header 
    wprintf(L" ");
    wchar_t wd[BUFSIZ];
    int i;
    for (i = 0; i < 7; i++)
    {
        /*
        char *day = nl_langinfo (ABDAY_1 + (first_weekday + i) % 7);
        swprintf(wd, BUFSIZ, L"%.*s", wdayslen, day); 
        wprintf(L"%-*ls", dayspacelen+wdayslen, wd);
        */
        char *day = nl_langinfo (ABDAY_1 + (first_weekday + i) % 7);
        printf("%.*s", wdayslen*isutf8str(day), day); printf("%*s", dayspacelen, " ");
    }
    wprintf(L"\n");
    
    //left padding
    int padding;
    if (first_weekday > tm.tm_wday)
        padding = ((7 + tm.tm_wday - first_weekday))*(dayspacelen+wdayslen);
    else 
        padding = ((tm.tm_wday - first_weekday))*(dayspacelen+wdayslen);
    wprintf(L"%*s", padding, "");
    
    //print calendar
    int pre_mon = tm.tm_mon;
    while (tm.tm_mon == pre_mon)
    {            
        if (tm.tm_year == tm_now.tm_year && tm.tm_mday == tm_now.tm_mday && tm.tm_mon == tm_now.tm_mon)
        {
            int pad = dayspacelen+wdayslen-4;
            wprintf(L"[%2d]%*s", tm.tm_mday, pad < 0 ? 0 : pad, "");
        }
        else
            wprintf(L" %2d%*s", tm.tm_mday, dayspacelen+wdayslen-3, "");
        
        tm.tm_mday = ++tm.tm_mday;
        time_t tmp = mktime(&tm);
        localtime(&tmp);
        
        if (tm.tm_wday == first_weekday)
            wprintf(L"\n");
    }
    wprintf(L"\n");
    
    return 0;
}

void help(void)
{
    wprintf(L"Please enter a month.year (example: 2.2014)\n");
}