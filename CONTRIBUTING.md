# Contributing to triple-range-constraint

triple-range-constraint welcomes new contributors. This document will guide you
through the process.

 - [Question or Problem?](#question)
 - [Issues and Bugs](#issue)
 - [Feature Requests](#feature)
 - [Submission Guidelines](#submit)
 
## <a name="question"></a> Got a Question or Problem?

If you have questions about how to use triple-range-constraint check our documentation on the [README][README]. Alternatively, check [Stack Overflow][mlstack] to see if it has been answered there, and post your question there if not. Please tag it with MarkLogic and AngularJS.

## <a name="issue"></a> Found an Issue?

If you find a bug in the source code or a mistake in the documentation, you can help us by
submitting an issue to our [GitHub Issue Tracker][issue tracker]. Even better you can submit a Pull Request
with a fix for the issue you filed.

## <a name="feature"></a> Want a Feature?

You can request a new feature by submitting an issue to our [GitHub Issue Tracker][issue tracker].  If you
would like to implement a new feature then first create a new issue and discuss it with one of our
project maintainers.

## <a name="submit"></a> Submission Guidelines

### Submitting an Issue

Before you submit your issue search the archive, maybe your question was already answered.

If your issue appears to be a bug, and hasn't been reported, open a new issue.
Help us to maximize the effort we can spend fixing issues and adding new
features, by not reporting duplicate issues.  Providing the following information will increase the
chances of your issue being dealt with quickly:

* **Overview of the Issue** - if an error is being thrown a stack trace helps
* **Motivation for or Use Case** - explain why this is a bug for you
* **triple-range-constraint Version** - is it a named version or from our master branch
* **MarkLogic version**
* **Suggest a Fix** - if you can't fix the bug yourself, perhaps you can point to what might be
  causing the problem (line of code or commit)

### Submitting a Pull Request

#### Fork triple-range-constraint

Fork the project [on GitHub](https://github.com/patrickmcelwee/triple-range-constraint/fork) and clone
your copy.

```sh
$ git clone git@github.com:username/triple-range-constraint.git
$ cd triple-range-constraint
$ git remote add upstream git://github.com/patrickmcelwee/triple-range-constraint.git
$ git fetch upstream
```

All bug fixes and new features go into the master branch.

We ask that you open an issue in the [issue tracker][] and get agreement from
at least one of the project maintainers before you start coding.

Nothing is more frustrating than seeing your hard work go to waste because
your vision does not align with that of a project maintainer.

#### Create a branch for your changes

Okay, so you have decided to fix something. Create a feature branch
and start hacking:

```sh
$ git checkout -b my-feature-branch -t upstream/master
```

#### Formatting code

We use [.editorconfig][] to configure our editors for proper code formatting. If you don't
use a tool that supports editorconfig be sure to configure your editor to use the settings
equivalent to our .editorconfig file.

#### Commit your changes

Make sure git knows your name and email address:

```sh
$ git config --global user.name "J. Random User"
$ git config --global user.email "j.random.user@example.com"
```

Writing good commit logs is important. A commit log should describe what
changed and why. Follow these guidelines when writing one:

1. The first line should be 50 characters or less and contain a short
   description of the change including the Issue number prefixed by a hash (#).
2. Keep the second line blank.
3. Wrap all other lines at 72 columns.

A good commit log looks like this:

```
Fixing Issue #123: make the whatchamajigger work in MarkLogic 8

Body of commit message is a few lines of text, explaining things
in more detail, possibly giving some background about the issue
being fixed, etc etc.

The body of the commit message can be several paragraphs, and
please do proper word-wrap and keep columns shorter than about
72 characters or so. That way `git log` will show things
nicely even when it is indented.
```

The header line should be meaningful; it is what other people see when they
run `git shortlog` or `git log --oneline`.

#### Rebase your repo

Use `git rebase` (not `git merge`) to sync your work from time to time.

```sh
$ git fetch upstream
$ git rebase upstream/master
```

#### Push your changes

```sh
$ git push origin my-feature-branch
```

#### Submit the pull request

Go to https://github.com/username/triple-range-constraint and select your feature branch. Click
the 'Pull Request' button and fill out the form.

Pull requests are usually reviewed within a few days. If you get comments
that need to be to addressed, apply your changes in a separate commit and push that to your
feature branch. Post a comment in the pull request afterwards; GitHub does
not send out notifications when you add commits to existing pull requests.

That's it! Thank you for your contribution!

#### After your pull request is merged

After your pull request is merged, you can safely delete your branch and pull the changes
from the main (upstream) repository:

* Delete the remote branch on GitHub either through the GitHub web UI or your local shell as follows:

    ```shell
    git push origin --delete my-feature-branch
    ```

* Check out the master branch:

    ```shell
    git checkout master -f
    ```

* Delete the local branch:

    ```shell
    git branch -D my-feature-branch
    ```

* Update your master with the latest upstream version:

    ```shell
    git pull --ff upstream master
    ```

[README]: https://github.com/patrickmcelwee/triple-range-constraint
[mlstack]: http://stackoverflow.com/questions/tagged/marklogic
[issue tracker]: https://github.com/patrickmcelwee/triple-range-constraint/issues
[.editorconfig]: http://editorconfig.org/
