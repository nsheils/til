---
title: "How to set sensible defaults for github"
date: "2025-05-26T20:41:46-0500"
tags: [github, git]
summary: ""
---

I finally got around to setting some sensible defaults to personalize GitHub.
The following script works well to set what makes sense for me.

```
script_path = "/mnt/data/setup_git_config.sh"
new_script_content = textwrap.dedent("""\
    #!/usr/bin/env bash
    # ----------------------------------------------------------
    # Git personal bootstrap script
    # Sets Natalie Sheils’s preferred global Git configuration.
    # Run once:  bash setup_git_config.sh
    # ----------------------------------------------------------
    set -e
    
    echo "Applying global Git configuration..."
    
    # ----------------------------------------------------------
    # Core identity & defaults
    # ----------------------------------------------------------
    git config --global core.editor "vim"
    git config --global init.defaultBranch main
    git config --global user.name "nsheils"
    git config --global user.email "natalie.sheils@gmail.com"
    
    # ----------------------------------------------------------
    # History & pull behavior
    # ----------------------------------------------------------
    git config --global pull.rebase true
    git config --global rebase.autoStash true
    git config --global fetch.prune true
    
    # ----------------------------------------------------------
    # Push ergonomics
    # ----------------------------------------------------------
    git config --global push.autoSetupRemote true
    git config --global push.default current
    git config --global remote.pushDefault origin
    git config --global push.ff only
    
    # ----------------------------------------------------------
    # Diff & merge clarity
    # ----------------------------------------------------------
    git config --global merge.conflictStyle diff3
    git config --global diff.colorMoved zebra
    
    # ----------------------------------------------------------
    # Safety nets
    # ----------------------------------------------------------
    git config --global rerere.enabled true
    
    # ----------------------------------------------------------
    # UI niceties
    # ----------------------------------------------------------
    git config --global status.showStash true
    
    # ----------------------------------------------------------
    # Helpful aliases
    # ----------------------------------------------------------
    git config --global alias.st "status"
    
    # -----------------------------------------------------------------
    # Alias: git new <slug>
    #
    # Quickly create and switch to a branch that follows your naming
    # convention:    <user>_<MM_DD>_<slug>
    #
    #   * <user>  : your git user.name with spaces replaced by underscores
    #   * <MM_DD> : current month & day (e.g., 05_26)
    #   * <slug>  : whatever you pass to `git new`, automatically lower‑cased
    #               and spaces changed to dashes.
    #
    # Example:
    #   $ git new “analytics endpoint”
    #   # on May 26 the branch becomes:
    #   #   nsheils_05_26_analytics-endpoint
    #
    # First push will create the upstream automatically because we set
    #   push.autoSetupRemote=true        (see above)
    # -----------------------------------------------------------------
    git config --global alias.new '!f() { \
        user=$(git config user.name | tr "[:space:]" _); \
        stamp=$(date +%m_%d); \
        raw=$(echo "$1" | tr "[:upper:]" "[:lower:]" | sed -e "s/[[:space:]]\\+/-/g"); \
        git switch -c "${user}_${stamp}_${raw}"; \
    }; f'


    echo "All done! Global Git configuration updated."
    """)
with open(script_path, "w") as f:
    f.write(new_script_content)
os.chmod(script_path, stat.S_IRWXU | stat.S_IRGRP | stat.S_IROTH)

```

