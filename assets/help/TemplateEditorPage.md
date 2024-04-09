Enables the user to edit a checklist template.

## Edit Options
On the bottom right corner there is the "Options" button:

* *Edit Info*: opens the "Edit Info" dialog box.
* *Add page*: creates a new page in the template. The template can be organized in pages. Every template must have at least one page.
* *Add Regular Check*: creates a new regular check in the current page. This button is only enabled after the first page is created.
* *Add Linearity Step 1 Check*: create a new linearity step 1 check. This button is only enabled after the first page is created and if there is no other linearity step 1 check present in the template.
* *Add linearity Step 2 Check*: create a new linearity step 2 check. This button is only enabled after the first page is created, if there alreadu is a linearity step 1 check present in the tempalte and if there is no other linearity step 2 check present in the template.

### Edit Info
Here the user can edit the following info:
* *Rebreather manufacturer*
* *Rebreather model*
* *Title*
* *Description*

#### Buttons
* *Update*
* *Cancel*

## Add Regular Check
Allow the creation of a new regular check.

**Fields:**
* *Description*: mandatory main text describing the option.
* *Observation*: optional extra info accesable through the blue question icon.
* *Timer duration*: optional timer set in minutes and seconds. If left empty or at 0:00, no timer is presented to the user.
* *References*: define how many "reference" fields will be presented.

Each reference can have it's own optional prefix and suffix.

### Buttons
* *Create*
* *Cancel*

## Linearity Checks
Linearity checks calculate the linearity of the voltages produced by oxygen cells when exposed to a pO² of 1.0 atm.

The expected value is calculated from the voltage value produced by the same cells when exposed to a pO² of 0.21 atm.

On the first step the user should inform the voltage produced by each cell when exposed to a pO² of 0.21 atm. At this time the check will calculate the expected voltage at pO²s of both 1.0 and 1.6 atm.

On the second step the user informs the actual voltage the cells produced when exposed to a pO² of 1.0 atm. With this last value the lienarity for each cell isn calculated and expressed in terms of a percentage. 100% is the ideal expected value.

## Add Linearity Step 1 Check
Allow the creation of a linearity step 1 check.

**Fields:**
* *Description*: mandatory main text describing linearity checks step 1 being created.
* *References*: defines how many lines (for how many cells) the table will hold.

## Add Linearity Step 2 Check
Allow the creation of a linearity step 2 check.

**Fields:**
* *Description*: mandatory main text describing linearity checks step 2 being created.
