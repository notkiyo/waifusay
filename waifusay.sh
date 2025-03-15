#!/bin/bash

#!/bin/bash

# Check dependencies
for cmd in cowsay lolcat lsb_release; do
    command -v "$cmd" >/dev/null 2>&1 || { echo "Error: $cmd not found. Install it first."; exit 1; }
done

# Function:  random greeting
random_greeting() {
    local greetings=(
        "B...s come in all sizes, like WiFi bars. And no matter the strength, they always connect to my heart."
        "sup $USER"
        "hi $USER, what you up to today?"
        "If history has taught us anything, it’s that ignoring your problems sometimes works."
        "Skill issue? No, lag issue."
        "If I had a nickel for every time an anime protagonist screamed their attack name, I’d own Japan."
        "In anime, if your hair changes color, someone’s about to get wrecked."
        "If you can’t fix it with duct tape, you’re not using enough duct tape."
        "404: Motivation not found."
        "I don’t rage quit, I tactically disengage."
        "Why is ‘skip tutorial’ never an option in real life?"
        "A...e logic: Glasses = instant IQ boost."
        "'I'm not strong enough!' - Gets punched - 'Okay, now I am.'"
        "Bugfix: B...plugs no longer allow time travel."
        "It’s better to p...s in the sink, than sink in the p...s."
        "Oh, you again? I was hoping for someone smarter."
        "Hello, $USER. Hope you brought extra brain cells today."
        "You have logged in. Bad decision."
        "Welcome back! Error 404: Nobody asked."
        "Running on $SHELL? Bold choice. Wrong, but bold."
        "Just remember, every key you press could be a mistake."
        "You exist. That’s enough disappointment for today."
        "The fact that you’re reading this means you haven’t rage quit yet. Good job."
        "Your keyboard is now a judgmental AI. And it’s judging you."
        "Statistically speaking, you’re probably bad at games."
        "I’d tell you a Linux joke, but you’d probably just apt-get it wrong."
        "They say ‘time is money,’ but looking at you, I see we’re both broke."
        "Your system has been up for 7 hours. Impressive. Just like my patience for you."
        "You use Fish shell? What’s next, a Crab-based package manager?"
        "Your Arch Linux is very impressive. Just like my ability to pretend I care."
        "You love open source? Cool, I’m open to ignoring you."
        "Error 503: Brain Service Unavailable."
        "Your RAM is full of tabs and regrets."
        "You must be a sysadmin, because you manage to make everything worse."
        "I see you’re using Linux. Now all you need is a personality."
        "Sudo? More like sudon’t."
        "Installing updates... wait, you still exist?"
        "You’re like a semicolon in Python—completely unnecessary."
        "You're the human equivalent of a ‘rm -rf /’ command."
        "Welcome back, $USER! I see you still haven’t upgraded your brain’s firmware."
        "$USER logged in? Damn, there goes the uptime record."
        "$USER detected. IQ levels dropping... please wait..."
        "Oh, it’s you again, $USER. And here I thought today was gonna be a good day."
        "Hey $USER, I ran a virus scan… turns out, you ARE the problem."
        "Your keyboard must be terrified every time you start typing, $USER."
        "$USER, you have successfully logged in. Your parents have successfully logged out of pride."
        "Why do you even use Linux, $USER? Ctrl+C and Ctrl+V are the only commands you know."
        "I’d explain Linux to you, $USER, but then I’d have to explain what a ‘brain’ is first."
        "Damn $USER, even Vim is easier to exit than a conversation with you."
        "$USER, I checked your search history. You should be on a government watchlist."
        "Your skills are like a WiFi signal, $USER—weak and constantly dropping."
        "I’d call you a tool, $USER, but even Vim has more functionality than you."
        "$USER, even Clippy from Microsoft Word would give up trying to help you."
        "Failure is just success, if you lower your standards enough."
        "Don’t be sad, $USER. You’ve already disappointed everyone, so there’s no pressure."
        "When life gives you lemons, trade them for anime figurines."
        "If at first you don’t succeed, blame it on lag."
        "Hard work never killed anyone. But why take the risk?"
        "Confidence is knowing you’re wrong but arguing anyway."
        "Your dreams are valid, but so is my right to laugh at them."
        "If it works, it’s not stupid. If it doesn’t, you probably did it."
        "Remember: If life is a game, then clearly you left it on ‘Very Hard’ mode."
        "It’s not about ‘why,’ it’s about ‘why not’—which is why I put RGB lights in my toaster."
        "Why do today what you can put off until next reboot?"


    )

    # Select a random message
    local message="${greetings[RANDOM % ${#greetings[@]}]}"

    # Select a random waifu
    local cow_dir="/usr/share/cowsay/cows/"
    local random_cow="default"
    [[ -d "$cow_dir" ]] && random_cow=$(find "$cow_dir" -type f | shuf -n 1)

    # Print message using cowsay + lolcat
    cowsay -f "$random_cow" "$message" | lolcat
}

#  Print system info
print_info() {
    local info=$(cat <<EOF
  User:      $(whoami)
  Linux:     $(lsb_release -ds 2>/dev/null || grep '^NAME' /etc/*release | cut -d= -f2 | tr -d '\"')
  Uptime:    $(uptime -p | cut -d ' ' -f2-)
  Shell:     $SHELL
  Disk:      $(df -h / | awk 'NR==2 {print $3 "/" $2}')
EOF
)

    # Get the longest line for box width
    local width=$(echo "$info" | awk '{print length}' | sort -nr | head -n1)
    local border=$(printf '━%.0s' $(seq 1 $((width + 4))))

    # Print the info with box styling
    echo -e "┏$border┓" | lolcat
    echo "$info" | awk '{print "┃ " $0 " "}' | lolcat
    echo -e "┗$border┛" | lolcat
}


# Print waifu first, then system info
random_greeting
echo ""
print_info

