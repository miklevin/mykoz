# Figlet is available for banner messages
figlet -t Installing Google Chrome

# Install Google Chrome Dependencies
sudo apt-get install libxss1 libappindicator1 libindicator7 -y

# Get the Google Chrome debian installer
cd /tmp
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install Google Chrome using hte local installer
sudo apt install ./google-chrome*.deb -y

# Install Microsoft Playright browsers, edited out in favor of Chrome
# playwright install

# Install teh default Pypeteer Chromium browser, edited out in favor of Chrome
# pyppeteer-install

sudo apt install x11-apps
