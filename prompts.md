# Prompts

Every prompt given to Claude Code for this project, in order. The session ran
on 2026-10-11 and 2026-10-12 using Claude Fable 5.1. Claude's responses are in
`transcript.md`.

## 1

Build a simple web app for my plastic surgery practice to track patients taking GLP-1 medications.

For each patient, record their name, medication (semaglutide or tirzepatide), and starting weight. Let staff log visits with the date, current dose, weight, and any side effects.

Show a patient list and a detail page for each patient with their visit history. Make it work well on a phone.

Store everything on the device, and show a banner at the top saying "Demo only. Fake data. Nothing leaves your browser." Fill it with a few made-up patients so I can try it out, and a button to delete the demo patients when I want to.

Then deploy it to Netlify so I can open it on my phone; use a simple project name without punctuation like dashes.

## 2

init a git repo and commit this

## 3

On each patient's page, add a chart showing their weight over time, with their dose changes marked on it.

## 4

Add a BMI column and show % change on the patient list  On the patient list, flag anyone who has lost more than 20% of their starting weight. They may be candidates for a body contouring consultation. Show the total percentage lost next to each name.

## 5

Review this app for security problems and anything that would need to change before it could hold real patient data.

## 6

Fix the title leak, UTC date, and add a CSP header

## 7

Add a README explaining the deploy steps

## 8

I see you installed puppetteer.  Did you install other software, and how is it installed,and how can I remove it if I want

## 9

So puppetteer is only installed for this project and won't affect other software on my system?

## 10

I would like to change the deploy to commit 1166961, before the "security changes".  Please do that if possible.

## 11

If I make the github repo public for those viewing the demo, is there anything (e.g. in the netlify config) that would be exposed?

## 12

This project is mostly to demonstrate the use of Claude Code.  Please put together two transcript files, one called "prompts", with all of the prompts, including this one, from the beginning of this project, and another called "transcript" with both the prompts and Claude's responses.  Also add a permissive MIT-like open source license.
