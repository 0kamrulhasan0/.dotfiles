//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/

	{" CPU:", "top -bn 1 | awk '/^%Cpu/ {print $2+$4+$6\"%\" }'",	30,		0},

	{"Mem:", "free | awk '/^Mem/ { print int($3*100/$2)\"%\" }'",	30,		0},

	{"Bat:", "acpi | awk '{print $4}' | sed s/,//",	30,		0},

  {"Wifi:", "nmcli dev wifi | tail -n1 | awk '{print $8\"%\"}'",	30,		0},

	{"", "date '+%b %d (%a) %I:%M%p'",					5,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
