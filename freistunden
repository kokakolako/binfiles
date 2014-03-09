curl -s "http://vertretungsplan.mcs-bochum.de/V_TS_001_1.html" > /tmp/fehlstunden.tmp
cat /tmp/fehlstunden.tmp | grep "Fehlende Lehrer"
cat /tmp/fehlstunden.tmp | grep -A 12 "</body>"
