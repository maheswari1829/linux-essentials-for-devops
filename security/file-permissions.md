# File Permissions in Linux

- `chmod 755 file` → rwx for owner, r-x for group/others  
- `chown user:group file` → change ownership  
- `umask 022` → default permissions for new files  
- `ls -l` → check permissions  

## Example
-rwxr-xr-- 1 user user 120 Sep 15 script.sh
