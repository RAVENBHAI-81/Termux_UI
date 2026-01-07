# === CLEAN RX: NO BACKGROUND JOB MESSAGES ===
set +m

# === SMART AUTO-UPDATE ON MATRIX QUIT ===
if [ -z "$MATRIX_DONE" ]; then
    export MATRIX_DONE=1

    colorize_pkg() {
        local colors=(32 31 33)
        while IFS= read -r line || [[ -n "$line" ]]; do
            [[ -z "$line" ]] && continue
            local rand_color=${colors[$RANDOM % 3]}
            printf "\e[1;${rand_color}m%s\e[0m\n" "$line"
        done
    }

    clear
    cmatrix -ab -u 2

    clear
    mpv --no-terminal ~/system_voice/system_voice_1.mp3 > /dev/null 2>&1 &
    disown
    echo -e "\e[1;36m[RX] Starting system update...\e[0m"

    if (pkg update && pkg upgrade -y && pkg autoclean) 2>&1 | colorize_pkg; then
        clear
        mpv --no-terminal ~/system_voice/system_voice_2.mp3 > /dev/null 2>&1 &
        disown
        echo -e "\e[1;32m[NN] All system update and checking are completed the system is now fully operational!\e[0m"
        sleep 6
        clear
    else
        clear
        echo -e "\e[1;31m[NN] Update failed or skipped. Continuing anyway...\e[0m"
        sleep 2
        clear
    fi
fi

# === RX GLITCH INTRO ===
clear
echo -e "\e[1;31m[!] CRITICAL SYSTEM ACCESS DETECTED...\e[0m"
sleep 0.2
for i in {1..15}; do
    echo -ne "\e[1;32m$RANDOM $RANDOM $RANDOM $RANDOM $RANDOM\r"
    sleep 0.05
done
clear

# === UI HEADER ===
figlet -f slant "KALI-SYSTEM" | lolcat
echo -e "\e[1;34m------------------------------------>"

# === DATA GATHERING (For the Right Panel) ===
# Get CPU Temp from internal sensors
cpu_temp=$(cat /sys/class/thermal/thermal_zone*/temp 2>/dev/null | head -n 1)
[ ! -z "$cpu_temp" ] && cpu_display="$((cpu_temp / 1000))°C" || cpu_display="N/A"
# Get Local IP (Dynamic version)
local_ip=$(ip route get 1.1.1.1 2>/dev/null | awk '{print $7}')
[ -z "$local_ip" ] && local_ip="Disconnected"


# === RENDER MAIN DASHBOARD ===
fastfetch
echo -e "\e[22A\e[55C \e[1;31m[ HARDWARE MONITOR ]"
echo -e "\e[55C \e[1;34m┌────────────────────────────┐"
echo -e "\e[55C \e[1;34m│ \e[1;37mCPU TEMP:  \e[1;32m$cpu_display \e[1;34m        │"
echo -e "\e[55C \e[1;34m│ \e[1;37mIP ADDR:   \e[1;32m$local_ip \e[1;34m │"
echo -e "\e[55C \e[1;34m│ \e[1;37mCORES:     \e[1;32m$(nproc) Online \e[1;34m     │"
echo -e "\e[55C \e[1;34m│ \e[1;37mENC:       \e[1;32mAES-256 ACTIVE \e[1;34m  │"
echo -e "\e[55C \e[1;34m└────────────────────────────┘\e[0m"
echo -e "\e[17B"

# === STARTUP TOOLS & ALIASES ===
bash ~/rx_tools.sh --startup
alias rx_tools='bash ~/rx_tools.sh'
alias lock='cmatrix -ab -u 2'
export PS1="\[\e[1;34m\]┌──(\[\e[1;32m\]KAli@SYSTEM\[\e[1;34m\])-[\[\e[1;37m\]\w\[\e[1;34m\]]\n\[\e[1;34m\]└─\[\e[1;32m\]\$\[\e[0m\] "
alias m='tmux new-session "cmatrix -ab -u 2"'
alias hydra='~/hydra/hydra'
alias lab='python3 ~/SecurityLab/run.py'
alias inject='bash ~/mcpack_injector.sh'
alias disable='bash ~/remove.sh'
alias enable='bash ~/enable.sh'
alias refresh='source ~/.bashrc'