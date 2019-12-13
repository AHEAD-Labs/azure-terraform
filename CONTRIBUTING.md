# Contributing

## Flow
* Please follow [git flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow).
* Release versions will be tagged off of master for use as a ref in module calls.

## Style
* All code must be run through:
    * `terraform fmt`
    * `terraform validate`
    * `tflint` if possible
 
## Reviews
* All code moving from a release branch into the master branch must be peer reviewed.
* A short description of the change and the impact is needed for updates to existing modules.
* Utilize [pull requests]