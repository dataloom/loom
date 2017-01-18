Loom Superproject
==============================

Get started developing faster!

This superproject helps you get started building on the Kryptnostic platform by providing a single repository for all necessary projects at the appropriate versions.

Getting started
==============================

* Ensure your [ssh-keys are generated](https://help.github.com/articles/generating-ssh-keys). Add them to [Github](http://github.com).
* Clone the superproject and all of its submodules:

        git clone ssh://git@github.com/dataloom/loom.git --recurse-submodules

* Install and start Cassandra 3.9 (`brew install cassandra` and `cassandra` on OS X)
* Install and start ElasticSearch 5.x (`brew install elasticsearch` and `elasticsearch -E cluster.name=loom_development` on OS X)

Eclipse environment setup
==============================

* From the `loom` directory, run the "eclipse" gradle task to set up the appropriate Eclipse project structure

        ./gradlew eclipse

* In Eclipse, click Import -> Existing Projects (make sure you select the "Search for nested projects" option)
    * The root directory is the `loom` superproject directory (wherever that might be on your local filesystem)
    * Import all of the selected projects

IntelliJ environment setup
==============================

We've found that using the built-in Import project at the root level works better than trying to use the gradle project generator. You should also enable annotation processing in the IntelliJ settings.


Running locally 
==============================

* Ensure that:
    * You've completed the "Getting started" section above
    * Xcode is installed and you've agreed to the license
    * `JAVA_HOME` is configured properly and JDK 8 is installed
    
* Optional:
    * Install gradle via `brew install gradle` `// running commands with gradle will generally run faster than ./gradlew but gradlew is portable`

# From the `loom` superproject directory:

Tools provided
==============================

* **./gradlew** - The superproject's build.gradle sets the 'developmentMode' variable, allowing you to build your projects using projectDependencies

* **createGradleAnnounceScript.sh** - Running this will set up a gradle announce plugin configuration globally. It will also initiate a mac install script to install Growl. The result of this is that all gradle commands will pop up in a notification for Mac users. This may be useful when waiting for builds to complete

Adding a new project
==============================

We manage subprojects using [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules). See WORKFLOWS.md for some representative workflows.

If a new subproject needs to be added:

* edit **settings.gradle** to add it as a gradle subproject
* run `git submodule add ssh://git@github.com/dataloom/<subproject>`
