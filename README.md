# ![ Super ] (super.png)

Loom Superproject
==============================

Get started developing faster!

This superproject helps you get started building on the Kryptnostic platform by providing a single repository for all necessary projects at the appropriate versions.

Getting started
==============================

* Ensure your [ssh-keys are generated](https://help.github.com/articles/generating-ssh-keys). Add them to [Stash](http://stash.krypt.int) and [Github](http://github.com).
* Clone the superproject and all of its submodules:

        git clone ssh://git@stash.krypt.int:7999/kryp/loom.git --recurse-submodules

Eclipse environment setup
==============================

* From the `kryptnostic` directory, run the "eclipse" gradle task to set up the appropriate Eclipse project structure

        ./gradlew eclipse

* In Eclipse, click Import -> Existing Projects (make sure you select the "Search for nested projects" option)
    * The root directory is the `loom` superproject directory (wherever that might be on your local filesystem)
    * Import all of the selected projects

Running locally (first time)
==============================

* Ensure that:
    * You've completed the "Getting started" section above
    * Xcode is installed and you've agreed to the license
    * `JAVA_HOME` is configured properly and JDK 8 is installed
    * wget is installed via `brew install wget`
    * [`cmake`](https://cmake.org) is installed and in your `PATH`
    * You have installed Docker: https://www.docker.com/products/docker#/mac
* Optional:
    * Install gradle via `brew install gradle` `// running commands with gradle 'command' will generally run faster than ./gradlew but gradlew is portable`

# From the `loom` superproject directory:

* Build images from your local code

    `./gradlew docker`

* Run the full stack. Comment out anything you dont want to run in docker-compose.yml

    `./runStack.sh`

* Open [localhost/app](localhost/app) in your browser

Tools provided
==============================

* **./gradlew** - The superproject's build.gradle sets the 'developmentMode' variable, allowing you to build your projects using projectDependencies

* **createGradleAnnounceScript.sh** - Running this will set up a gradle announce plugin configuration globally. It will also initiate a mac install script to install Growl. The result of this is that all gradle commands will pop up in a notification for Mac users. This may be useful when waiting for builds to complete

Adding a new project
==============================

We manage subprojects using [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules). See WORKFLOWS.md for some representative workflows.

If a new subproject needs to be added:

* edit **settings.gradle** to add it as a gradle subproject
* run `git submodule add ssh://git@stash.krypt.int:7999/kryp/<subproject>`
