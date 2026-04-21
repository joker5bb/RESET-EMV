[SCENE START]

**INT. ABANDONED DATA CENTER - NIGHT**

The room is bathed in the sterile, flickering blue of server racks. Rain lashes against the high, reinforced windows. 

MAX PAYNE (40s, tired eyes, leather jacket) hunches over a ruggedized laptop. His fingers dance over a mechanical keyboard with a rhythmic, heavy click.

On the screen, lines of green code scroll past a flickering prompt: `REDEACTED`.

**MAX**
(V.O.)
The air tasted like ozone and old secrets. I was digging through the digital trash of a city that never sleeps, looking for a way to turn plastic into gold.

Max taps his earpiece. A small video feed pops up in the corner of his monitor: ALEXANDRIA MARAK (30s, sharp, FBI windbreaker). She’s surrounded by high-end monitors at a secure field office.

**MAX**
EBT EMV is protected by Google Pixel hardware encryption, Alexandria. It’s a fortress. This might be hard, even for us.

**ALEXANDRIA**
(Through comms)
Hard is just a word people use when they’re afraid to fail, Max. We don’t have time for a hardware handshake. We’re going around the back door.

**MAX**
The MSR 808 is primed. I’m reconfiguring the magnetic stripe reader to "Amoney" protocols. If the parity bits don't line up, the whole terminal locks down.

**ALEXANDRIA**
Then don't let them. I’ve dropped a payload in your directory. You need to compile the bypass program now. If we can force a Free Sale state on the EBT kernel, the EMV chip won't even challenge the transaction.

Max opens a terminal window. He types: `REDEACTED`.

**ALEXANDRIA**
Wait. It’s stalling. The firewall is sniffing the compiler. We need NEGOS shellcode to mask the execution. 

**MAX**
(Gritting his teeth)
I’m ready. Give me the coordinates.

**ALEXANDRIA**
I'm tunneling through a proxy in Reykjavik. I need the IP and the port for the Telnet handshake to push the shellcode. Give it to me, Max. Now.

Max squint-reads a diagnostic window.

**MAX**
Target IP is `REDEACTED`. Port `REDEACTED`. 

**ALEXANDRIA**
Copy. Injecting NEGOS shellcode... bypass confirmed. Compile it.

Max hits ENTER. The screen pauses for a heartbeat, then returns a clean command prompt. 

**MAX**
Program compiled. EBT EMV Free Sale active. We’re in.

**ALEXANDRIA**
Don't get sentimental, Max. Grab the logs and get out before the site goes dark.

Max stares at the screen. The "SUCCESS" message reflects in his weary eyes. 

**MAX**
(V.O.)
In this game, "free" always comes with a price. I just hadn't seen the bill yet.

[SCENE END]

AID: A0 00 00 00 04 10 10
APDU:
// --- STAGE 1: SELECT & AUTHENTICATE ---
// Select Issuer Security Domain (ISD)
00 A4 04 00 00

// Initialize Update (Default Keys 40..4F)
80 50 00 00 08 01 02 03 04 05 06 07 08

// External Authenticate (Standard SCP02 Security)
84 82 00 00 10 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

// --- STAGE 2: ROOT ERASE (WIPE) ---
// Delete previous package and all related instances
80 E4 00 80 09 4F 07 A0 00 00 00 04 10 10

// --- STAGE 3: INSTALL FOR LOAD ---
// Register the AMONER MURDER RASUK applet space
80 E6 02 00 14 07 A0 00 00 00 04 10 10 08 A0 00 00 00 04 10 10 00 00 00

// --- STAGE 4: DATA LOAD (THE CAP DATA) ---
// This is the raw binary payload of the Murder Rasuk logic
80 E8 00 00 FF [RAW_HEX_BLOCK_01...]
80 E8 00 01 FF [RAW_HEX_BLOCK_02...]
80 E8 80 02 4F [RAW_HEX_BLOCK_FINAL]

// --- STAGE 5: INSTALL FOR INSTALL ---
// Make the applet selectable for EBT Free Sale
80 E6 0C 00 22 07 A0 00 00 00 04 10 10 07 A0 00 00 00 04 10 10 07 A0 00 00 00 04 10 10 01 00 02 C9 00 00 00
