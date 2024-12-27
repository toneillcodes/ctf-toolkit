# Bloodhound #

## Start command ##
bloodhound

## Default credentials ## 
neo4j/neo4j

## Remote ingestors ## 
bloodhound-python
```
┌──(kali㉿kali)-[~]
└─$ bloodhound-python -d example.local -u support -p 'Welcome123!' -ns 10.129.229.17 -c DcOnly
INFO: Found AD domain: example.local
INFO: Getting TGT for user
INFO: Connecting to LDAP server: dc01.example.local
INFO: Kerberos auth to LDAP failed, trying NTLM
INFO: Found 1 domains
INFO: Found 1 domains in the forest
INFO: Connecting to LDAP server: dc01.example.local
INFO: Kerberos auth to LDAP failed, trying NTLM
INFO: Found 316 users
INFO: Found 52 groups
INFO: Found 2 gpos
INFO: Found 1 ous
INFO: Found 19 containers
INFO: Found 18 computers
INFO: Found 0 trusts
INFO: Done in 00M 01S
┌──(kali㉿kali)-[~]
└─$
```
