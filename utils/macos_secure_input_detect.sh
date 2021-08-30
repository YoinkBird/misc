#!/usr/bin/env bash
set -ue
set -o pipefail
set -x
 ioreg -l -w 0 | grep --color SecureInput
 set +x
 cat <<EOC > /dev/null
  |   "IOConsoleUsers" = ({"kCGSSessionOnConsoleKey"=Yes,"kSCSecuritySessionID"=100009,"kCGSSessionSecureInputPID"=166,"kCGSessionLoginDoneKey"=Yes,"kCGSSessionIDKey"=257,"kCGSSessionSystemSafeBoot"=No,"kCGSSessionUserNameKey"="<username>","kCGSSessionGroupIDKey"=20,"kCGSessionLongUserNameKey"="<longusername>","kCGSSessionAuditIDKey"=100009,"kCGSSessionLoginwindowSafeLogin"=No,"kCGSSessionUserIDKey"=501})
    | |   "IOConsoleUsers" = ({"kCGSSessionOnConsoleKey"=Yes,"kSCSecuritySessionID"=100009,"kCGSSessionSecureInputPID"=166,"kCGSessionLoginDoneKey"=Yes,"kCGSSessionIDKey"=257,"kCGSSessionSystemSafeBoot"=No,"kCGSSessionUserNameKey"="<username>","kCGSSessionGroupIDKey"=20,"kCGSessionLongUserNameKey"="<longusername>","kCGSSessionAuditIDKey"=100009,"kCGSSessionLoginwindowSafeLogin"=No,"kCGSSessionUserIDKey"=501})
EOC

ps -ef "$( ioreg -l -w 0 | grep --color SecureInput | grep -o '"kCGSSessionSecureInputPID"=\d\+"' | grep -o "\d\+")"
cat <<EOC
  UID   PID  PPID   C STIME   TTY           TIME CMD
  501   166     1   0 Mon10AM ??         0:21.39 /System/Library/CoreServices/loginwindow.app/Contents/MacOS/loginwindow console
EOC
