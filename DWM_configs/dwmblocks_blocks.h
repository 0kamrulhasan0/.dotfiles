//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/

	{" CPU:", "mpstat 1 10 | tail -n1 | awk 'NR==1 {printf 100-$NF}'",	10,		0},

	{"Temp:", "sensors | grep temp1 | tail -n1 | cut -d ' ' -f9",	10,		0},

	{"Mem:", "free | awk '/^Mem/ { print int($3*100/$2)\"%\" }'",	10,		0},

	{"Bat:", "acpi | acpi | grep -Eo '[0-9]+%'",	10,		0},

  //{"Wifi:", "cat /sys/class/net/wlp1s0/operstate",	30,		0},
  //{"Wifi:", "nmcli dev status | grep '^wlp1s0.*' | cut -d' ' -f17",	30,		0},
  //{"Wifi:", "nmcli dev wifi | sort -k2 | head -n1 | rev | cut -d' ' -f5 | rev",	30,		0},
  //{"", "nmcli dev wifi | grep '*' | cut -d' ' -f10",	30,		0},
  {"", "nmcli dev wifi | grep '*' | rev | cut -d' ' -f5 | rev ",	10,		0},

	{"", "date '+%b %d (%a) %I:%M%p'",					5,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim[] = " | ";
static unsigned int delimLen = 5;
