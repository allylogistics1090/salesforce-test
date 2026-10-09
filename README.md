# Load Assessment – Starter Project

This repository sets up the objects you'll use during your live technical session.
It does **not** contain the assignment itself; we'll walk you through that on the call.

## What's included

- **Load__c** – a shipment record with Status, Carrier, Delivered Date, Last Status Change,
  Needs Review, and Billing Notified fields, plus a tab, page layout, and "All" list view.
- **Load_Delivered__e** – a Platform Event with `Load_Id__c` and `Carrier__c` fields.
- **Load Assessment** permission set – gives you access to the Load object, fields, and tab.
- **scripts/apex/seed-loads.apex** – creates 20 sample loads.
- Empty `classes/` and `triggers/` folders, ready for your code.

## Your org

We'll email you the login details for a Salesforce org we've set up for you. The objects above and
20 sample loads are already in it, so there's nothing to deploy before the session. The org is
deleted a few days after your interview.

## Setup (do this before the session)

```bash
git clone https://github.com/allylogistics1090/salesforce-test.git
cd salesforce-test
sf org login web --alias assessment --set-default --instance-url <login URL from our email>
sf org open
```

Log in with the username and password from our email. The first time you log in from a new browser,
Salesforce emails a verification code to the address we invited. In the org, open the App Launcher,
search for **Loads**, and confirm you see 20 records.

During the session, deploy your code with `sf project deploy start` as usual.

If anything fails, reply to your recruiting contact and we'll help you sort it out.

## For interviewers

With the `InterviewHub` Dev Hub authorized on your machine, create a candidate's org the day before:

```powershell
./scripts/interviewer/new-candidate-org.ps1 -Alias cand-jdoe -CandidateEmail jdoe@example.com
```

It creates a scratch org (expires in 3 days unless you pass `-Days`), deploys this project, assigns the
permission set, seeds 20 loads, and prints the login URL, username, and password to email the
candidate. Delete the org after the interview with `sf org delete scratch -o cand-jdoe -p`. The free
Dev Hub allows 3 active scratch orgs and 6 new ones per day.
