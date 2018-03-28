# jenkins

### `Jenkinsfile`

Every step performed by the Pipeline (it can also be executed from the repository itself). This script will also call the Job as a final step.

### `get-artifact.sh`

This shell script is the first part of the Jenkins Job for deployment. After this is included as an `Execute shell` step in the `Build` options of the Job, using (for example) the **Publish Over SSH** plugin, the `deploy.sh` script can be executed remotely.