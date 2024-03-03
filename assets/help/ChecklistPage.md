Where you actually complete the choosen checklist.

There are two kinds of checklist items:
1. Regular items
2. Linearity check items

## Regular
Regular items only need to be checked to be considered done.

They can, optionally have 3 extra resources:
1. **Countdown timer**: helps with items that need to account for some elaped time before being considered completed. The countdown is just a helper. You can check the item vefore the countdown is complete. You don't even need to start the countdown if you don´t need it. With a long press, you can change the duration of the countdown.
2. **Value register**: usefull to register some value of interest: sensor milivolts, battery charge, etc. 
3. **Info**: extra info presented when clicking on the blue circled i icon.

All extra optional resources are activated in template editing mode, i.e., when creating or modifying templates.

## Linearity check
Linearity check items are divided in two parts:
1. **Air data**: enter the *mV* for each cell when exposed to air.
2. **Pure oxygen data**: enter the *mV* for each cell when exposed to pure oxygen.
All calculations are automatically executed.

### Step 1
The user enters the air *mV* data. The app calculates the */0.21* and the *x1.6* column data:
1. **/0.21**: shows the *mV* value the cell should reach when exposed to pure oxygen if it were perfectly linear, based on the informed air *mV* value.
2. **x1.6**: shows the *mV* value the cell should reach when exposed to pure oxygen at 6 m deep (1.6 BAR) if it were  perfectly linear, based on the informed air *mV* value.

### Step 2
The user enters the pure oxygen *mV* data on the *actual* column. The app calculates the _%&ZeroWidthSpace;_ data:
1. __%&ZeroWidthSpace;__: show the percentage of the */0.21* calculated value that the cell actually reached.

This value almost never gets to 100%. It should be monitored by the diver as it tends to get lower and lower meaning the cell is getting less and less linear. Values of 90% or more are usually accepted.

**Follow your CCR training guidelines in this regard!**
*As you should in all others.* 😉
