
DKIM Key Size Checking Scripts
=============================

Scripts to quickly automate part of the process of checking domains for weak DKIM keys.

---

## Setup 

> ***This section is not necessarily necessary if using included files.***

Clone and compile MassDNS. Then copy used files to the home directory.

```
git clone https://github.com/blechschmidt/massdns

cd massdns

make

cp -v bin/massdns ../massdns.bin

cp -v lists/resolvers.txt ../

cd ../
```


Clone MailFail and then copy the list of DKIM selectors to the home directory.

```
git clone https://github.com/ACK-J/MailFail

cp -v MailFail/DKIM_Selectors.txt ./
```

---

## Usage

1. Create a list of all the organization's domains.
    - In this example, it will be named `domains.txt`.


2. Run `dkim-check.sh` to check all the domains for common DKIM selector records.

```
./dkim-check.sh domains.txt output.txt
```


3. Either manually review the output, or parse it with `parse-dkim-output.sh`.
    - Parsing the output with `parse-dkim-output.sh` will display only the domains where DKIM selectors were found.

```
./parse-dkim-output.sh output.txt
```


4. Manually review the domains/DKIM records with MailFail. Recommmended:
    1. In Firefox, open `about:config` and change `network.http.redirection-limit` to `0` (zero). This keeps domains from redirecting so they can be analyzed with MailFail.
    2. Install MailFail.
        - https://addons.mozilla.org/en-US/firefox/addon/mailfail/
    3. Install Open Multiple URLs. This will let you paste the whole list of domains into Firefox all at once.
        - https://addons.mozilla.org/en-US/firefox/addon/open-multiple-urls/
    4. Click the MailFail button on each tab that you open, and let it run to get the DKIM results.



