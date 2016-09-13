## Some Representative Workflows

#### Status of all subprojects:

    Elliotts-MBP:kryptnostic elliott$ git submodule foreach 'git status'
        Entering 'fhe-core'
        On branch develop
        Your branch is up-to-date with 'origin/develop'.
        nothing to commit, working directory clean
        Entering 'hazelcast-server'
        On branch develop
        Your branch is up-to-date with 'origin/develop'.
        nothing to commit, working directory clean
        ...

#### Check out a stable "snapshot" across all projects:

    Elliotts-MBP:kryptnostic elliott$ git checkout stable
        M   fhe-core
        M   hazelcast-server
        M   heracles
        ...
        Switched to branch 'stable'
    Elliotts-MBP:kryptnostic elliott$ git submodule update
        Submodule path 'fhe-core': checked out '93251a84951747f848015b6a6b10f1a6080935b3'
        Submodule path 'hazelcast-server': checked out '6a842996d0c578686c391f497c4f2d717ed7e261'
        Submodule path 'heracles': checked out '685c7cf3389ae3a3efc0b2a26224ed19c104bb27'
        ...
    Elliotts-MBP:kryptnostic elliott$

#### Make a new "snapshot" after doing work in multiple subprojects:

    Elliotts-MBP:kryptnostic elliott$ cd kryptnostic-mapstores; ./do-some-work-and-commit.sh; cd ..
    Elliotts-MBP:kryptnostic elliott$ cd kryptnostic-services; ./do-some-work-and-commit.sh; cd ..
    Elliotts-MBP:kryptnostic elliott$ git status
        On branch develop
        Your branch is ahead of 'origin/develop' by 1 commit.
          (use "git push" to publish your local commits)
        Changes not staged for commit:
          (use "git add <file>..." to update what will be committed)
          (use "git checkout -- <file>..." to discard changes in working directory)

            modified:   kryptnostic-mapstores (new commits)
            modified:   kryptnostic-services (new commits)

        Submodules changed but not updated:

        * kryptnostic-mapstores 8a5f59b...9ad9f93 (1):
          > Update README.md

        * kryptnostic-services 267b6d1...72fc7e5 (1):
          > Update README.md

        no changes added to commit (use "git add" and/or "git commit -a")
    Elliotts-MBP:kryptnostic elliott$ git add kryptnostic-mapstores kryptnostic-services
    Elliotts-MBP:kryptnostic elliott$ git status
        On branch develop
        Your branch is ahead of 'origin/develop' by 1 commit.
          (use "git push" to publish your local commits)
        Changes to be committed:
          (use "git reset HEAD <file>..." to unstage)

            modified:   kryptnostic-mapstores
            modified:   kryptnostic-services

        Submodule changes to be committed:

        * kryptnostic-mapstores 8a5f59b...9ad9f93 (1):
          > Update README.md

        * kryptnostic-services 267b6d1...72fc7e5 (1):
          > Update README.md

At this point, `git commit` will commit the new snapshot.  Note that both the metaproject and all affected subproject need their changes pushed to Stash before someone else can go and check out the snapshot.

We can also add a tag if, for example, this is a snapshot corresponding to a particular release.
