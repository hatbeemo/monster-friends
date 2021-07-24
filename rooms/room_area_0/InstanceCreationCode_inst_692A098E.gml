text="* Chocolate or vanilla?&&      {choice 0} Chocolate      {choice 1} Vanilla{choice `TMP`}";
//text is initial prompt where player can make choice.
//somehow, {choice `TMP`} is essential to add at the end of this text, to ensure choices work properly
choice0="* Chocolate? {sleep 10}&* I see... {pause}{clear}* Good choice!";
//choice0 is immediate text response when {choice 0} is picked.
choice1="* Vanilla? {sleep 10}&* I see... {pause}{clear}* Good choice!";
//choice1 is immediate text response when {choice 1} is picked.
afterchoice0="* Mmm, chocolate...";
//afterchoice0 is response on 2nd interaction when {choice 0} is picked.
afterchoice1="* Mmm, vanilla...";
//afterchoice1 is response on 2nd interaction when {choice 1} is picked.
