# Fill Github Contributions

This shell script is used to fill Github contributions by creating multiple commits for each day between a given start date and end date. It uses a random number with max and min values of your choice to determine the amount of commits for each day. It also gives you the option to set a percentage where commits will be skipped for each day.

## Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/h3nc4/Fill-github-contrib.git
    ```

2. Modify the script variables in the config.sh file to your desired values:

    ```bash
    # The date of the first commit, in the format YYYY-MM-DD
    START_DATE="2022-01-01"
    # The date of the last commit
    END_DATE="2023-01-01"
    # The commit message
    COMMIT_MESSAGE="Dont judge people by commits"
    # Some git repository path
    REPO_PATH="/path/to/MyProject"
    # Max number of commits per day
    MAX_COMMITS_PER_DAY=10
    # Min number of commits per day
    MIN_COMMITS_PER_DAY=0
    # Chance that there will be no commits on a day, ***IN PERCENT***
    NO_COMMITS_CHANCE=20
    ```

3. Run the script:

    ```bash
    cd Fill-github-contrib/src
    chmod +x fillcontribs.sh
    ./fillcontribs.sh
    ```

## License

This project is licensed under the BSD License - see [LICENSE](LICENSE) for details.

## On other platforms

If you *still* use Windows, consider using [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) to run this script.

## Why This Script?

In college, my professor congratulated me for having lots of commits on my GitHub profile, unlike some of my friends. It got me thinking about how we often judge developers by these squares.

**Fill Github Contributions** is a script I made to add commits to your profile without the pressure of big commits. Remember, coding is more than just squares on a graph!

Don't judge people by commits.
