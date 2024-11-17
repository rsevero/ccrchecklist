# CCR Checklist

* [Just using](#just-using)
* [Creating/editing templates](#creatingediting-templates)
    * [Check types](#check-types)
        * [Regular Check](#regular-check)
        * [Linearity Check (step 1)](#linearity-check-step-1)
        * [Linearity Check (step 2)](#linearity-check-step-2)
        * [Complete Linearity Check](#complete-linearity-check)
        * [Complete X Stepped Linearity checks](#complete-x-stepped-linearity-checks)
* [Outputs](#outputs)
* [Ownership of checklists](#ownership-of-checklists)

![CCR Checklist logo](./aux/app_icon/ccrchecklist.png)

_CCR Checklist_ is a very flexible Checklist app for CCR (rebreather) users.

Definitely not your run-of-the-mill "this app provides a checklist for rebreather X made by Y".

It includes several checklists for a variety of rebreather models from a growing list of manufactures.

It's main distinguishing feature is that the checklists are editable: that's right, you can change the available templates (the files that define a checklist), maybe changing the order of some steps, adding (or even removing) steps.

In reality you can do whatever you want, even create a complete template from scratch!

## Just using

If you simply want to use _CCR Checklist_ to help you build your rebreather, check if there is a checklist available for it.

It's rather simple: on the initial page select the manufacturer of your rebreather on the main list, then select the model and choose one of the listed cehcklists. Just click on it and enjoy.

If there is no checklist for your rebreather or you don't want to use one of the available ones, you will have to create one.

## Creating/editing templates

To create a new checklist template or edit an existing one, start clicking on the editor button, on the upper right corner. It's a pencil.

After that you can either create a entirely new template clicking on the plus button on the lower right corner or select an existing template to edit or use a starting point to create your own.

During editing you have undo/redo, save and save as buttons on the top right corner and a actions menu on the lower right corner where you can choose what elements you want to create.

### Check types

A tempalte in _CCR Checklist_ is composed of 1 or more pages that group 1 or more checks each.

Currently there are 4 types of checks:

1. [Regular Check](#regular-check)
2. [Linearity Check (step 1)](#linearity-check-step-1)
3. [Linearity Check (step 2)](#linearity-check-step-2)
4. [Complete Linearity Check](#complete-linearity-check)

With these features it gets quite easy to create a template that fits your requirements, be it a official checklist created by a manufacturer, be it the customized checklist you prefer to use for some special use only you seems to have.

#### Regular Check

Despite it's name _Regular Check_ is definitely the most important and powerful check available on _CCR Checklist_.

Besides the mandatory descritpion field that actually defines what the check is about, you can also optionally include in a _Regular Check_:

* __Extra info__: activates a ![blue info icon](./aux/images/info.png) info icon that presents the extra info (observation, note, clarification, whatever);
* __Timer__: useful for those checks that involves some kind of time measure: positive test for 5 min, pre-breathe for 1 min, etc.;
* __References__: perfect for those checks where you need to take note of some measured value like oxygen tank pressure, bailout mixture composition, etc. When defining a check with references you can also optionally define prefixes and suffixes for each reference.

#### Linearity Check (step 1)

Implements the first ("air") step of a linearity check on oxygen cells: here you will record the values obtained for air measurement on oxygen cells.

To create one, you define the mandatory description of the check and the amount of cells that should be tracked.

The app automatically calculates the expected values both for "100% oxygen" and for "100% oxygen at 6 m deep".

#### Linearity Check (step 2)

Implements the second ("100% oxygen") step of a linearity check on oxygen cells: here you record the values actually obtained when exposing your cells to 100% oxygen.

To create one you just have to define the description of the check as it will automatically track the same amount of cells as the step 1 previsouly defined.

The app automatically calculates the "linearity" of each cell as a percentage comparing the expected "100% oxygen" value with the one actually measured.

#### Complete Linearity Check

The _Complete Linearity Check_ works just like it's "stepped" siblings. the difference is that both steps are present at the same check.

#### Complete X Stepped Linearity checks

The stepped version should be used when you want to separate the linearity check so the user does each measuremente &mdash; "air" and "100% oxygen" &mdash; at different moments during the checklist.

The complete version expects the user will do both measurements one after the other.

You can have as many complete checks as you like on the same checklist but you can only have one pair of Step 1 + Step 2 Linearity checks per checklist.

## Outputs

_CCR Checklist_ offers two main outputs:

1. PDF version of finished checklist;
2. Shareable version of checklist template.

## Ownership of checklists

All checklists available at _CCR Checklist_ are propriety of their respective owners. _CCR Checklist_ developers claim no propriety of any checklists.

If you are the owner of a checklist and want it removed from the app, please open an issue [here](https://github.com/rsevero/ccrchecklist/issues).
