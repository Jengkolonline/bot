#!/bin/bash
# Getting
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/Jengkolonline/izinn/main/ip"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          404 NOT FOUND AUTOSCRIPT          \033[0m"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/Jengkol_Online"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6282372139631"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
clear
echo -e " \033[31m##########\033[33m##########\033[32m##########\033[34m##########\033[35m##########\033[36m##########\e[0m"
echo -e " \033[31m╭══════════════════════════════════════════════════════════╮\e[0m"
echo -e " \033[34m│$NC\033[33m                       MENU BOT                           $NC\033[34m│\e[0m"
echo -e " \033[33m╰══════════════════════════════════════════════════════════╯\e[0m"
echo -e " \033[32m╭══════════════════════════════════════════════════════════╮\e[0m"
echo -e " \033[35m│$NC [01]${NC} \033[0;36m Chek User Login Bot SSH${NC}"
echo -e " \033[35m│$NC [02]${NC} \033[0;36m Chek Member Bot SSH${NC}"
echo -e " \033[35m│$NC [03]${NC} \033[0;36m Chek User Bot Vmess${NC}"
echo -e " \033[35m│$NC [04]${NC} \033[0;36m Chek User Bot Vless${NC}"
echo -e " \033[35m│$NC [05]${NC} \033[0;36m Chek User Bot Trojan${NC}"
echo -e " \033[35m│$NC [06]${NC} \033[0;36m Daftar BOT SSH${NC}"
echo -e " \033[35m│$NC [07]${NC} \033[0;36m Bacup BOT${NC}"
echo -e " \033[35m│$NC [08]${NC} \033[0;36m Restart BOT${NC}"
echo -e " \033[35m│$NC [09]${NC} \033[0;36m Add BOT Notif${NC}"
echo -e " \033[35m│$NC [10]${NC} \033[0;36m Delet BOT Notif${NC}"
echo -e " \033[36m╰══════════════════════════════════════════════════════════╯\e[0m"
echo -e " \033[31m##########\033[33m##########\033[32m##########\033[34m##########\033[35m##########\033[36m##########\e[0m"
echo -e ""
read -p " Select From Options [ 1 - 8 ] : " opt
echo -e ""
case $opt in
1) clear ; bot-cek-login-ssh ; exit ;;
2) clear ; bot-member-ssh ; exit ;;
3) clear ; bot-cek-ws ; exit ;;
4) clear ; bot-cek-vless ; exit ;;
5) clear ; bot-cek-tr ; exit ;;
6) clear ; apt update && apt install wget -y && wget https://raw.githubusercontent.com/Jengkolonline/bot/main/xolpanel.sh && chmod +x xolpanel.sh && ./xolpanel.sh ; exit ;;
7) clear ; menu-backupp ; exit ;;
8) clear ; restorebot ; exit ;;
9) clear ; add-bot-notif ; exit ;;
10) clear ; del-bot-notif ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "Anda salah tekan " ; sleep 1 ; menu-ssh ;;
esac
