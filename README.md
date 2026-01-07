# 🚀 Termux_UI

A simple custom UI setup for **Termux** that changes the terminal look, adds startup behavior, and includes some fun demo scripts.

This project is made for learning, fun, and customization of the Termux environment.

---

## ✨ Features

- Custom `bashrc` (startup UI / environment)
- Easy enable & remove system
- Sound/voice files support
- Extra tool script (`rx_tools.sh`)
- 🎭 `ZeroFun` folder with **fake / fun scripts** (no real hacking)

---

## 📁 Folder Structure
├── README.md
├── ZeroFun
│   ├── brute.sh
│   ├── decrypt_sim.sh
│   ├── network_sim.sh
│   └── zero_rain.sh
├── enable.sh
├── remove.sh
├── rx_tools.sh
└── system_voice
    ├── system_voice_1.mp3
    └── system_voice_2.mp3

---

## ⚠️ Important Note About ZeroFun

The `ZeroFun` folder is **ONLY FOR FUN**.

All scripts inside it are:
- ❌ NOT real hacking  
- ❌ NOT real brute-force  
- ❌ NOT real network attacks  

They are just **fake simulations / visual fun scripts** made for entertainment and practice.

---

## 📥 Installation (Termux)

Open Termux and run:

```bash
pkg update -y
pkg install git -y
git clone https://github.com/RAVENBHAI-81/Termux_UI.git
cd Termux_UI
chmod +x *.sh
bash enable.sh
Then restart Termux.

▶️ Enable Manually
If not enabled:
Copy code
Bash
bash enable.sh
❌ Remove Termux_UI
To restore default:
Copy code
Bash
bash remove.sh
Restart Termux after removing.
🛠 About bashrc
The file is named bashrc (not .bashrc) to avoid being hidden on some file managers.
The enable.sh script handles placing it correctly.
🧪 Run fun scripts
Example:
Copy code
Bash
cd ZeroFun
bash brute.sh
❤️ Disclaimer
This project is for education and fun only.
The author is not responsible for any misuse.
👤 Author
RAVEN RX
Bangladesh 🇧🇩