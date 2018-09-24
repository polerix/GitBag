#https://www.redelijkheid.com/blog/2015/6/22/custom-raspberry-pi-console-login-message

let upSeconds="$(/usr/bin/cut -d. -f1 /proc/uptime)"
let secs=$((${upSeconds}%60))
let mins=$((${upSeconds}/60%60))
let hours=$((${upSeconds}/3600%24))
let days=$((${upSeconds}/86400))
UPTIME=`printf "%d days, %02dh%02dm%02ds" "$days" "$hours" "$mins" "$secs"`

# get the load averages
read one five fifteen rest < /proc/loadavg

echo "$(tput setaf 2)
+---------------------------------------------------------------------------+
|                                                                           |
|  /yysyhhhhhhyyyyyyhdhhdhdds-                -oyoydddddhdddddddddhdddhh+   |
|   -ooo+o+ooossssoyysyhdmd-   :ysss-  -sydy:   -hmdyhyyyssssoooo++ooss:    |
|     :dmNMMMMmdhyoossyhNm-   yy//sMN++NMs//ss   -NNysssosssdmNNMMNmh:      |
|      `//:-:/+shhmNhsoyNNh-   `-+yyhddyhy+-`   -hMMssshNNdys+/::-:/`       |
|         /dmNdyo:-/ymmshMMMNmNMNdMNyMMhNMmMNNNNNMMdommy/:/ohmNNm+          |
|          .``-ommmo:oNdyMhmdNhshMsNMMMyMhodmdNhMydNs/smmy+:``.             |
|            -yds:.smm/+Ny+M:homMsmNNNNmsmysd:M+hMs+NNs.-sh+-               |
|                -hd/`+my.my   :+ymmmmmNhs/`  hN-hMh.smh.                   |
|                 ` :oo`.`     -hNNNMMMh:     `-`ss- `                      |
|                             -myhdmNmdyN/                                  |
|                          `hhNs:yydNdy/+Nsy+                               |
|                          -+msd``:hm/`:h+h+-                               |
|                           y`.    ``    .`h.                               |
|                                                                           |
|                                                                           |
|               +-----------------------------------------+                 |
|               |      I M P E R I U M  O F  M A N        |                 |
|               +-----------------------------------------+                 |
|                                                                           |
+---------------------------------------------------------------------------+


+---------------------------------------------------------------------------+
                                                                             
                                      
            _,.-------.,_             
        ,;~'             '~;,         `date +"%A, %e %B %Y, %r"`
      ,;X\                   ;,       
     ;XXXX|                   ;       `uname -srmo`$(tput setaf 1)
    ,'XXXX|(o)         ( )     ',     
   ,;XXXXX|                     ;,    
   ;X;xxxx| .           .      ; ;    Uptime.............: ${UPTIME}
   |X;xxx_+____       ______   ; |    
   |xx`/~"     ~" . "~     "~\'  |    Memory.............: `cat /proc/meminfo | grep MemFree | awk {'print $2'}`kB (Free) / `cat /proc/meminfo | grep MemTotal | awk {'print $2'}`kB (Total)
   |X/~  ,-~~~^~, | ,~^~~~-,  ~  |    
    |X| |  [(@))]}:{  /(o)\ |   |     Load Averages......: ${one}, ${five}, ${fifteen} (1, 5, 15 min)
  //|X| l o \_/ / | \ \___/ !   |     
 || .~| (__,.--" .^. "--.,__)  ~.     Running Processes..: `ps ax | wc -l | tr -d " "`
 ||  |    -o-;' //| \ `;-o-    |      
 +==============/-^\/       .__/      
      V| \                 / |V       
         |T~\___!___!___/~T|          
         |`IIII_I_I_I_IIII'|          Local IP Addresses.: `hostname -I`
               } [ ] {                WAN IP Address.....: `wget -q -O - http://icanhazip.com/ | tail`
             [_} [ ] {_]              
               } [ ] {                Weather............: `curl -s "http://rss.accuweather.com/rss/liveweather_rss.asp?metric=1&locCode=EUR|NL|NL001|UTRECHT|" | sed -n '/Currently:/ s/.*: \(.*\): \([0-9]*\)\([CF]\).*/\2°\3, \1/p'`
              \_ [ ] _/                
                \[H]/                 
                                                                             
+---------------------------------------------------------------------------+
$(tput sgr0)"






