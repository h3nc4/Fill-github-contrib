# Fill Github Contributions

This shell script allows you to populate your GitHub contributions graph with commits across a range of dates. You can customize the number of commits per day, set a probability for skipping certain days, and specify other parameters to tailor the behavior.

## Features

- Generate commits for each day within a specified date range.
- Randomize the number of commits per day within a customizable range.
- Skip commits on certain days based on a configurable probability.
- Supports custom commit messages, branch selection, and more.

## Usage

To run the script with the required parameters:

```console
$ ./fill_contrib -s 2020-01-01 -e 2025-01-01 -r /path/to/your/repo -b main
```

### Parameter list

| Parameter | Description | Required | Default Value |
| --------- | ----------- | -------- | ------------- |
| `-s` | Start date (YYYY-MM-DD) | Yes | N/A |
| `-e` | End date (YYYY-MM-DD) | Yes | N/A |
| `-m` | Commit message | No | "Don't judge people by commits" |
| `-r` | Path to the local Git repo | Yes | N/A |
| `-b` | Branch name | No | Current branch |
| `-x` | Maximum commits per day | No | 5 |
| `-n` | Minimum commits per day | No | 0 |
| `-p` | Percentage chance of skipping a day's commits | No | 20 |

### Example Usage

```console
# Generate commits from Jan 1, 2023, to Dec 31, 2023, in the "main" branch:
$ ./fill_contrib -s 2023-01-01 -e 2023-12-31 -r /path/to/repo -b main

# Customize the number of commits and skip chance:
$ ./fill_contrib -s 2023-01-01 -e 2023-12-31 -r /path/to/repo -x 10 -n 2 -p 30
```

### Push Commits

After running the script, you'll be prompted to push the changes:

```console
Push X commits? (y/N)
```

## On other platforms

If you *still* use Windows, consider using [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) to run this script.

## Why This Script?

In college, my professor congratulated me for having lots of commits on my GitHub profile, unlike some of my friends. This repo shows how little value they are to a developer's value.

## License

This project is licensed under the BSD License - see [LICENSE](LICENSE) for details.

Don't judge people by commits.
