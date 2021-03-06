+++
date = "2016-04-07T09:17:49+07:00"
title = "Working with DB nulls in Golang"
tags = [ "Go", "DB" ]
type = "post"
+++

This post shows how to marshall NULL values from the database into Go struct and how to avoid mistakes during fetching optional values with SELECT query. I'll show standard types sql.NullString, sql.NullInt64, etc types.


#### Customer table example

Customer table has mandatory ID and Email fields and optional Phone(string)/Age(int). I will show you a basic code how to fetch Customer by Email, marshall data into Go struct.

{{< gist plutov 16aa74048059f15f8800271e15e1204a >}}

#### Error

Now let's imagine that our Customer has an empty Phone (NULL in the DB), in this case SQL driver will fail to marshall DB NULL into string with the following error:

```
sql: Scan error on column index 1: unsupported driver -> Scan pair: <nil> -> *string
```

When you skip this error you will have incorrect data in Customer object, for example if Age is not NULL it will be marshalled into Phone field.

#### sql.NullString, sql.NullInt64, sql.NullFloat64, sql.NullBool

Standard sql package has [4 types](https://golang.org/pkg/database/sql/#NullString) for nullable data. With this only one change below error will be solved:

{{< gist plutov ee8da8cb49ae124ea6b7e82990e38f4f >}}

#### Retrieve value from sql.NullString

The `sql.Null[String,Int64,Float64,Bool]` types have two fields: a typed value and a boolean Valid. You can use the typed value to get either the value that's been set, or the type's "zero value" if it hasn't been set. You can get customer's phone number with the following code now:

{{< gist plutov 3698192fb293df50423a71c5e2c6673b >}}