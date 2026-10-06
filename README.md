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

## Setup (do this before the session)

```bash
git clone <this repository's link>
cd load-assessment
sf org login web --alias assessment --set-default   # skip if already done
sf project deploy start
sf org assign permset --name Load_Assessment
sf apex run --file scripts/apex/seed-loads.apex
sf org open
```

In the org, open the App Launcher, search for **Loads**, and confirm you see 20 records.

If anything fails, reply to your recruiting contact and we'll help you sort it out.
