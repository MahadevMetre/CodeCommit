#!/bin/bash

aws waf list-ip-sets > list-ip-sets.json
aws waf list-rate-based-rules > list-rate-based-rules.json
aws waf list-rules > list-rules.json
aws waf list-sql-injection-match-sets > list-sql-injection-match-sets.json
aws waf list-web-acls > list-web-acls.json
aws waf list-xss-match-sets > list-xss-match-sets.json