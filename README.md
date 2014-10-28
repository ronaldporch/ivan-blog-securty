#Ivan's Terrible Blog: Security Fixes

Ivan made some edits to his blog, but now he's open some security holes. Two specific ones were SQL Injection and Cross Site Scripting. If a malicious user inputted a value for "published" in the URL, he could "totally pwn" the web app. We fixed that by removing explicit calls for params in the index.

SQL Injection allowed malicious users to enter SQL searches into text fields, which could lead to dumping of his entire database! We patched it by making the SQL query in the model a string literal.
