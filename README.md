# Svitla Test Assignment
Test assignment for Svitla Systems job

## Description

Given an array of date-based events, construct the below output array.  Input may contain any number of keys.
 
Array of date-based events:

```ruby
events = [
 {date: 2014-01-01, a: 5, b:1},
 {date: 2014-01-01, xyz: 11},
 {date: 2014-10-10, qbz: 5},
 {date: 2014-10-10, v: 4, q: 1, strpm: -99}
 …
]
```

Consume events and produce an array of hashes:

```ruby
ouput = [
 {date: 2014-01-01, a: 5, xyz: 11 },
 {date: 2014-10-10, qbz: 5, v: 4, q: 1, strpm: -99},
 …
]
```

## Usage

Install dependencies (rspec) by running:

```
bundle install
```

This is implemented as `SvitlaTestAssignment.group_by_date` method.
You can check it by running specs:

```
rspec .
```