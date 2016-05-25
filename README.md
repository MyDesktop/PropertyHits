PropertyHits
============

Sample Perl and Python code for connecting to MyDesktop's Property Hits API.

The purpose of this endpoint is to provide external websites with access to update the property hits for a property.

## Usage Notes

- Submit a `POST` request with `JSON` payload as specified below
- `Hits` submitted are the total number of hits for that day
- A repeat `Hits` submission for a date will **override** the hits on that date with the new `Hits` figure

## Payload

- `Apikey` - Unique to each developer, MyDesktop will provide this to you on setup
- `Test` - If set to 0, hits will not be committed to the database
- `Properties` - An array of property objects

**Property Object**

- `UniqueID` - Property ID (MyDesktop primary key or REAXMLID)
- `AgentID` - Numeric ID for the office
- `Date` - The date the hits are for, in `YYYY-MM-DD` format
- `Hits` - Cumulative number of hits for this property on this date

## Setup and Support

Email support@mydesktop.com.au for assistance
