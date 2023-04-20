# simple-backuper
A simple Bash script to backup files and folders from a remote machine using `rsync`. The script supports copying specific folders listed in a configuration file and provides a menu-based interface to select which folder to backup.

## Prerequisites

- `rsync` and `ssh` installed on both local and remote machines
- Proper SSH access to the remote machine

## Configuration

Edit the `config.cfg` file to configure the backup settings:

- `SOURCE_PORT`: The SSH port number on the remote machine
- `SOURCE_IP`: The IP address of the remote machine
- `USERNAME`: The username to log in to the remote machine
- `SOURCES_FILE`: The file containing a list of folders to be backed up (one folder per line)
- `DESTINATION`: The destination folder on the local machine where the backups will be stored
- `EXCLUDE`: A space-separated list of file patterns to exclude from the backup

## Usage

To backup all folders listed in the `SOURCES_FILE`, simply run the script:

```bash
./remote_backup.sh
```

To use the menu-based interface to select which folder to backup, use the `--menu` or `-m` option:

```bash
./remote_backup.sh --menu
```

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Limitations and Known Issues

- This script assumes that you have already set up passwordless SSH access to the remote machine using SSH keys. If you need to use a password for SSH access, you will need to modify the script accordingly.
- The script currently does not support advanced error handling or retries in case of failure.