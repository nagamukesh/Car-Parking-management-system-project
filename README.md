# Car-Parking-management-system-project

## Abstract:
With the growing issues of urbanization and limited parking resources, developing a user-friendly Parking Management System is critical. This project provides a comprehensive system that combines parking slot occupancy detection and real-time slot availability display, with the user experience and parking facility efficiency as the top priorities. This method aims to address frequent urban difficulties such as traffic congestion and long parking search periods, which annoy vehicle owners. By utilizing modern occupancy sensors, central control units, and digital displays, we hope to simplify the parking experience. It detects car presence reliably, updates real-time slot availability, and communicates this information to users, minimizing the time and effort required to find a parking spot. Our unique contribution is the seamless integration of these components, which improves customer pleasure while optimizing space utilization. The system keeps track of entry and exit times, which can be utilized for security and auditing. Furthermore, the obtained data can guide future improvements and data-driven decision-making.

Our Parking Management System, by focusing on improving user experience and facility management, provides a realistic answer to the issues faced by urban parking, ultimately leading to more efficient and user-centric urban transportation solutions.

## Brief Description
### (Simulation to describe the user interaction, i.e. Output for various inputs)
Let us say this is how the screen looks originally
![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/5a95ac91-270e-402d-84c4-fbf39faaa595)

Each Block is given a button labeled 0,1,2... Depending on block number Over here, each block has 3 LEDs. If the LED is switched on, it means that a particular parking slot in that block is filled Looking at this diagram, the user can choose which block he wants to park in. NOTE: Junction 1 is the entrance. Let us say, the user wants to park in block 2 He presses the button for block 2.
![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/95f529c3-3779-4d92-9003-50f195b6ed5e)
![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/f67f7a51-9aec-4141-9380-ce05db840db3)

NOTE: Junction 1 is the entrance. Now, as we can see, the path to Junction2 is generated. At junction1, the north led is on, which means at junction1, the user must go straight. At junction 2, the west led is on, which means at junction 2, the user must go right. If the user follows the above instructions, he will reach the road from which he can enter the parking slot. Now, when the user enters the 3rd slot at block 2. The third sensor(clock), which is present at the entrance of the slot turns on. Which means, the person is going to enter that slot.

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/9fb95197-ce61-4568-8b8b-5752f63b64da)

Now that this clock is turned on, the path towards block 2 disappears. Bcos the car will be parked in this slot now, and thus doesn't need the directions anymore. Once the car parks in that slot, he will cross the entrance of that slot. Thus, the sensor(clock) for that slot becomes 0 again.

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/2fad07e7-9c41-4c93-ab10-8da2141bf5c1)

As we can see,
Now, on the screen, we can see that the third slot of block 2 which was previously empty
is now full as displayed by the LED after the current user parked in that slot
Now, let us see what happens in the case of the next user
Let us say, the user presses the block2 button and releases it
![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/c1d06a55-de2c-498d-8c7a-ada2f5ef278e)

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/a4a1b0c2-44c4-40ae-98de-483bdf9ea6da)

even though there are no vacant parking slots
No path to that block will be shown bcos, that block has no vacant slots

So, the user must select another block
Let us assume the user chooses block 0 now
He presses and releases the button for block 0

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/b7a9ee64-ee26-4faa-bb72-9044c55d990e)

Now, the path for junction 0 is displayed as we can see from the code
Go straight from junction1
Go straight at junction2
Take a left at junction3
But, let us say, the user doesn't follow the path and goes to block 6
And parks in the first slot
Now, when the user enters the 1st slot at block6
The first sensor(clock), which is present at the entrance of the slot turns on
This means, the person is going to enter that slot

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/c6c196c4-5862-40a5-a5de-ad9fcce99bf6)

Now that this clock is turned on, the path towards block0 disappears
Bcos the car will be parked in this slot now, and thus doesn't need the directions
anymore
Once the car parks in that slot
He will cross the entrance of that slot
Thus, the sensor(clock) for that slot becomes 0 again

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/f70cc365-1765-4ca9-bfd0-143af1ff03d8)

As we can see,
Now, on the screen, we can see that the first slot of block 6 which was previously empty
is now full as displayed by the LED after the current user parked in that slot
Now let us say, the car in the 2nd slot from block 1 is leaving
Bcos, the car is leaving, it passes through the entrance of that slot
So that sensor(clock) becomes 1

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/23d926b9-686b-46df-9d19-af946eb727bc)

Now when he leaves that slot,
The clock sensor becomes 0 again

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/a8ed53fd-dd4d-4751-a7bf-b65582e9a8c8)

As we can see,

The 2nd slot of block1, which was previously filled is now empty
Thus, there is a vacant spot available in block1 now
So, if the next user presses the block1 button, the path to block1 will be displayed

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/a9e64278-2ed6-4132-bb4b-45ae6819d193)

The aforementioned scenario seamlessly amalgamates all potential possibilities and
eloquently articulates the ensuing outcomes therewithin.
And this thus, explains what the project does
We will soon explain the work in the next section

### Working:
Let us go in sequential order, starting from pressing a button until parking in a slot
Where the work will be explained step by step,
and each component will be explained on its first occurrence based on the above-order

The user starts by pressing a button for a particular block
The way a button works it
When it is pressed, it is considered that the input is 1
The input for the next component will be the AND of the button input (which is 1) as long
as it is pressed and the availability of a free slot in that block
If a free slot is available, it returns 1, so when the button is pressed, the input will be 1&1
which is 1

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/e0ba9bb3-e699-499b-a70d-5ec4905e44e5)

As we can see, only 3 slots are filled as per the LEDs
This means a free slot is available
When the button is pressed, the output is 1

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/a30c22b6-8c6c-4959-9512-d9203121748c)

What will happen after this button press is that the path to this block will be displayed by
the junctions that are triggered by the 1 output that we get when the button is
pressed.

If no free slot is available, it returns 0, so when the button is pressed, the input will be 1&0
which is 0, i.e. there is no change in the circuit and input from this side will remain 0.
By default, the input from this block will be 0.

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/0effc873-0b22-47e5-bbdc-3cfc5c5ce425)

As we can see, bcos all 3 LEDs are blinking, no free slot is available, so even though the
the button is pressed, the output will be 0.
Bcos, there is no change in the output, pressing the button in this situation won't change
anything
Bcos this block is filled, a path to this block won't be shown
This input is connected to the BlockChooser
The input from Block i is connected to the ith port of BlockChooser
The Block Chooser will eventually return the BlockNumber of the most recent button
which is pressed.

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/3a5b03a7-a4b0-4345-a749-9c6ccd55e826)

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/7d697eb6-9d3f-42f2-bc39-5f4f6a2d43c4)
How this works is
If button 2 was pressed, the input 2 becomes 1
And simultaneously the clock tick for each flipflop changes from 0 to 1
Bcos the OR gate whose output was initially 0
Returns 1 now
And the output for the flipflop connected to input 2, becomes 1

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/68160e28-ce5f-4fdc-8810-194a92d4768d)

Now, bcos the clock is not ticking and is fixed at 1, even if the user presses multiple
buttons, only the 2nd flipflop output will be considered,
bcos until the next clock tick, the previous output will be displayed,
bcos the OR gate still remains at 1 for the added 1 input,
the clock tick doesn't change and is still at 1

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/e5374183-7958-4344-b5ad-baa8ca58b4d9)

Now, after the path is generated, which will be explained later
The user will leave,
So he is not pressing any button now
after releasing the buttons
The OR gate returns 0 bcos all inputs are 0
So the next clock tick is activated
So the previous input which is block 2 will be shown until another button is pressed

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/c94c90db-3ff2-4918-9889-699bfd2b5369)

8 outputs connected from 8 D flipflops corresponding to their 8 respective inputs as per
the above diagram will be taken as the corresponding inputs for the Priority Encoder
The Component marked Pri, is a Priority Encoder
Block 0 is input 0 in Pri
Block 1 is input 1 in Pri, and so on......
Note: Block 7 is a special button whose functionality will be explained later on
The Priority Encoder gives Block Number in binary form as output

As we can see, after pressing the button for Block2, The block number is 010 which is
the binary representation for Block2
Block2 will be the output until another clock tick/change, i.e. another button is
pressed, so the code will keep displaying the path for block2 until another button is
pressed (which will be button 7, the reason will be explained later)
Now, this output block number will be taken as input for Path Generator

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/eff48033-1c1b-4cb9-8fde-b15a663e5bab)

The highlighted component is PathGenerator

The PathGenerator will give PathData as output which will be used by the junctions to
display the path, i.e. which direction to go towards at each potential junction the user will
encounter to go to that path.

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/c10fb0dd-707b-429f-9547-8e9ca188a41b)

This operation is performed using a multiplexer
The Input at port k will be the PathData for Block Number k
And the selected input will be block number
So, depending on the block number, the path is given
If the block number is 3, the PathData to reach Block 3 is an output
Same for all blocks.
This operation is performed using a multiplexer

Now, let me explain what PathData means and what each junction is supposed to do
and does for particular PathData. After doing so, I’ll explain the junction layout for the
above example.

The Path Generator will generate PathData to reach the particular Block Number
PathData is essentially an 8-bit data, which gives information that represents a path.

The first 2 bits represent the direction to take at the first encountered junction
The next 2 bits represent the direction to take at the second encountered junction
The next 2 bits represent the direction to take at the third encountered junction
And so on...
Note: At each junction,
We can extract the first 2 bits from PathData and call it direction
From the first 2 bits of PathData
11 represents the front direction
10 represents the left direction
01 represents the right direction
00 is used for termination
(bcos we don't want the user to take a U-turn to reach their block, we don't use 00 to
represent the back direction. And after we reached all necessary junctions, the remaining
PathData will be 00______, the reason will be explained later, so we do not want any more
junctions to display anything)
And left shift by 2, so that at the next junction, we can use the next 2 bits for direction
Let input direction signify the direction from which, each junction receives the input
With regards to input direction at the junction, let
00 represent south
01 represent west
10 represent east
11 represent north

Here is a truth table signifying which light (NORTH, SOUTH, EAST, or WEST) of the
junction must be displayed depending on the input direction and
Depending on the direction of encountering the junction and the direction displayed based
on the 2 data inputs, here is a truth table

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/8a2b2964-da17-4e98-a5ee-04cd748f1383)

In this direction, the input direction is 00, i.e. south
If the input is 11, we must go front from the south direction which signifies north, north light is on
If the Input is 10, we must go left from the south direction which signifies west, The west light is on
If the Input is 01, we must go right from the south direction which signifies east, The east light is on
If the input is 00, no light will be on

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/0173e79d-3a84-4172-8d41-b239b1ec74c6)

In this direction, the input direction is 11, i.e. north
If the input is 11, we must go front from the north direction which signifies south, the south light is
on
If the Input is 10, we must go left from the north direction which signifies east, The east light is on
If the Input is 01, we must go right from the north direction which signified west, The west light is on
If the input is 00, no light will be on

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/98ba5691-0520-4428-8872-7bcc4da4de4c)

In this direction, the input direction is 10, i.e. west
If the input is 11, we must go front from the west direction which signifies east, east light is on
If the Input is 10, we must go left from the west direction which signifies north, the north light is on
If the Input is 01, we must go right from the west direction which signified south, The south light is
on
If the input is 00, no light will be on

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/b87af889-1e24-4e8a-9391-d848b439cb0c)

In this direction, the input direction is 10, i.e. east
If the input is 11, we must go front from the east direction which signifies west, the west light is on
If the Input is 10, we must go left from the east direction which signifies south, The south light is on
If the Input is 01, we must go right from the east direction which signified north, The north light is on
If the input is 00, no light will be on
Let us assume the display is 0 when direction from path data is 00 to simplification
easier,
We can add each light with a display so that nothing is displayed when the display is 0
So dis= dir[0] & dir[1];

Here is a truth table signifying the same

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/dd9924f2-1ed3-4082-82f2-ecd63405d3f9)

Using the same conventions for north as 11, south as 00, east as 01 and west as 10
I want the Output Direction to be the input direction for the next junction
So, if there is a junction with multiple outputs, we know what is the input direction
for the next junction directly, so we do not need to initialize the Input Direction for further
junction except at Junction1 for the entrance
So the light that must be displayed must be reversed to the Output Direction
Therefore
North Light for Output Direction 00
South Light for Output Direction 11
East Light for Output direction 10
West Light for Output Direction 01
And I can decide whether the particular light must be output using this
assign NL = dis && (!OutputDir[1] && !OutputDir[0]);
assign SL = dis && (OutputDir[1] && OutputDir[0]);
assign EL = dis && (OutputDir[1] && !OutputDir[0]);
assign WL = dis && (!OutputDir[1] && OutputDir[0]);
If we don't encounter 00, dis will be 1
So the above and condition wont be affected

If we encounter a 00, no light is displayed
Cos all lights will give output 0 with dis as 0 in and gate
And, later on, we’ll see that if no light is displayed, the path is complete,
thus we need not display anything,
Thus the next junction need not display anything
so we can set the first two inputs of path data as 00 for the next junction
So that the next junction doesn't display anything

So truth table for Output Direction is opposite to the Light which should be shown
Truth Table for Output Direction

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/d3bed5cd-15b3-46f8-94d5-a23f3d1ad4eb)

K-Map for OutputDir[1] is

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/9c18c71d-f476-4d38-8f5a-bfc09b7a8fe0)

Note: if dir is 10, dir[1] is 1 & dir[0] is 0
The function is
assign OutputDir[1] = (!dir[1] && !dir[0] && !InputDir[1])
|| (!dir[1] && dir[0] && !InputDir[0])
|| (dir[1] && dir[0] && InputDir[1])
|| (dir[1] && !dir[0] && InputDir[0]);

Based on how the function is,
We can use a multiplexer
So the effective code is
mux m1(!InputDir[1],!InputDir[0],InputDir[0],InputDir[1],dir,OutputDir[1]);

Similarly, for OutputDirection[0]
As per the truth table, the K-map is

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/ca2a2d55-dece-4614-9dc3-b0403a7b30f3)

function is
assign OutputDir[0] = (!dir[1] && !dir[0] && !InputDir[0])

|| (!dir[1] && dir[0] && InputDir[1])
|| (dir[1] && dir[0] && InputDir[0])
|| (dir[1] && !dir[0] && !InputDir[1]);

Based on how the function is,
We can use a multiplexer
So the effective code is
mux m2(!InputDir[0],InputDir[1],!InputDir[1],InputDir[0],dir,OutputDir[0]);

After this, if the next junction is at the left
For the junction at the left
The code returns the shifted path data, after the left shift of 2
assign NewPath = PathData << 2;
Note that, each junction can receive input from only one direction.
We are doing so to optimize the project by the usage of a lesser number of
components.
To do so, we need to ensure that the chosen PathDatas adhere to the above
conditions.
So, what we do is, when we choose the path data, we ensure that, in every PathData,
if a junction is to be encountered, the path to that junction will be unique.
This means the input direction to that junction will be unique,
Therefore, only one input direction for each junction.
This is the path data for each block for the parking layout

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/ef93086d-707d-43ac-9747-31375d5a1d99)

And this is the parking layout:

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/f176ff00-1fd6-42e4-a841-71afbb1024dd)

Now for our layout
Junction 1 passes New Pathdata to Junction 2 from the south direction
If the north light is displayed, it means we are supposed to go to Junction 2
So the first 2 characters will remain the same in NewPath so for junction1
(We make the first 2 characters 00 if we are not supposed to go in that direction, in this
case, when North Light is 00)
Junction1 j1(InputDir,PathData,NL1,SL1,EL1,WL1,OutputDir1,NewPath1);
assign InputDir2 = OutputDir1;
assign PathData2[7] = NewPath1[7] && NL1;
assign PathData2[6] = NewPath1[6] && NL1;
assign PathData2[5:0] = NewPath1[5:0];

Junction 2 passes New Pathdata to Junction 3 from the west direction is east light is on
And Junction4 from the north direction if the north light is on
If East light is on, the next junction we must go to is Junction 3
So we can add the first two digits of NewPath of Junction3 with the East Light so that for
junction3, path data will give output based on the next two digits in Path data
Because we are doing and with east lights,
If the north light was switched on and the east light was switched off, we were not supposed
to go to junction3
So the NewPath for Junction3’s first 2 digits will be 00
This means, nothing will be displayed at Junction3
We similarly do the same with North Light for Junction4

Junction2 j2(InputDir2,PathData2,NL2,SL2,EL2,WL2,OutputDir2,NewPath2);
assign InputDir3 = OutputDir2;
assign PathData3[7] = NewPath2[7] && EL2;
assign PathData3[6] = NewPath2[6] && EL2;
assign PathData3[5:0] = NewPath2[5:0];
assign InputDir4 = OutputDir2;
assign PathData4[7] = NewPath2[7] && NL2;
assign PathData4[6] = NewPath2[6] && NL2;
assign PathData4[5:0] = NewPath2[5:0];

Junction 3 and 4 don't pass New Pathdata to any junction
So the code for them is
Junction3 j3(InputDir3,PathData3,NL3,SL3,EL3,WL3);
Junction4 j4(InputDir4,PathData4,NL4,SL4,EL4,WL4);

Let us assume the PathData is 11111000

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/9ae6520b-1a28-40c9-a388-0a1afab9a6e0)

In this case, the PathData to Block0 is 11111000
As we can see
We will encounter junction1 from the south, so the input direction is 00 and at junction1, we
consider the first 2 bits from PathData which are 11
Junction displays north light
After the left shift, the new path data is 11100000 for Junction 2
We will encounter junction2 from the south, so the input direction is 00 and at junction2, we
consider the first 2 bits from PathData which are 11
Junction displays north light
Because we chose north light
We pass data to junction 4 and 0s to junction 3
Due to this junction 3 doesn't display anything
After the left shift, the new path data is 10000000 for Junction 4
As we can see
We will encounter junction1 from the south, so the input direction is 00 and at junction1, we
consider the first 2 bits from PathData which are 10
Junction displays east light
There are no more junctions, so the code ends

Now, for the Car sensors,
Let us take an example
Now, when the user enters the 3rd slot at block2
The third sensor(clock), which is present at the entrance of the slot turns on
This means the person is going to enter that slot

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/2e31cc31-853a-46ad-ac1f-48a776e2238a)

Now that this clock is turned on, the path towards block2 disappears
Bcos the car will be parked in this slot now, and thus doesnt need the directions
anymore
This is done by using button7 which will always display path 00000000 throught which
none of the junctions display anything
This button input is connected for port7 in block chooser
Button 7 is an xor gate to all 21 clocks
Earlier all clocks were 0, so 0 1s, even parity, so XOR returns 0
So button 7 is not chosen
NOTE: just saying button, but it is not realy a button
But when that clock is turned on while car is entering
1 clock shows 1, so 1 1 times, odd parity, so XOR returns 1
So button 7 is chosen, and as mentioned earlier, all junctions dont display anything
Once the car parks in that slot
He will cross the entrance of that slot
Thus, the sensor(clock) for that slot becomes 0 again

Button 7 is an xor gate to all 21 clocks
again all clocks were 0, so 0 1s, even parity, so XOR returns 0
So button 7 is not chosen
So as per the PathChooser code, the output is block7 for which all junctions still display
nothing

![image](https://github.com/nagamukesh/Car-Parking-management-system-project/assets/112798996/e1740a54-9e34-4d52-8b67-0d39512f5e2d)

As we can see,
Now, on the screen, we can see that the third slot of block 2 which was previously empty
is now full as displayed by the LED after the current user parked in that slot

### References
• Morris Mano, Digital Logic and Computer Design
• https://www.flashparking.com/blog/what-is-an-automated-parkingsystem/
• www.wayleadr.com
• https://www.slideshare.net
• Sunggu Lee, Advanced Digital Logic Design: Using VHDL, State Machines, and
Synthesis for FPGAs















